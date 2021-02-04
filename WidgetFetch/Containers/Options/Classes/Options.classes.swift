//
//  Options.classes.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 2/3/21.
//

import Foundation
import UIKit

/** Transforms an image to ASCII art. */
class ASCIIArtProvider
{
    fileprivate let
    image:   UIImage,
    palette: ASCIIPaletteProvider
    
    init(_ image: UIImage, _ palette: ASCIIPaletteProvider)
    {
        self.image   = image
        self.palette = palette
    }
    
    func createAsciiArt() -> String
    {
        let
        dataProvider = image.cgImage?.dataProvider,
        pixelData    = dataProvider?.data,
        pixelPointer = CFDataGetBytePtr(pixelData),
        intensities  = intensityMatrixFromPixelPointer(pixelPointer!),
        symbolMatrix = symbolMatrixFromIntensityMatrix(intensities)
        return symbolMatrix.joined(separator: "\n")
    }
    
    fileprivate func intensityMatrixFromPixelPointer(_ pointer: UnsafePointer<UInt8>) -> [[Double]]
    {
        let
        width  = Int(image.size.width),
        height = Int(image.size.height),
        matrix = Pixel.createPixelMatrix(width, height)
        return matrix.map { pixelRow in
            pixelRow.map { pixel in
                pixel.intensityFromPixelPointer(pointer)
            }
        }
    }
    
    fileprivate func symbolMatrixFromIntensityMatrix(_ matrix: [[Double]]) -> [String]
    {
        return matrix.map { intensityRow in
            intensityRow.reduce("") {
                $0 + self.symbolFromIntensity($1)
            }
        }
    }
    
    fileprivate func symbolFromIntensity(_ intensity: Double) -> String
    {
        assert(0.0 <= intensity && intensity <= 1.0)
        
        let
        factor = palette.symbols.count - 1,
        value  = round(intensity * Double(factor)),
        index  = Int(value)
        return palette.symbols[index]
    }
}

class ASCIIPaletteProvider
{
    fileprivate let font: UIFont
    
    init(font: UIFont) { self.font = font }
    
    lazy var symbols: [String] = self.loadSymbols()
    
    fileprivate func loadSymbols() -> [String]
    {
        return symbolsSortedByIntensityForAsciiCodes(32...126) // from ' ' to '~'
    }
    
    fileprivate func symbolsSortedByIntensityForAsciiCodes(_ codes: CountableClosedRange<Int>) -> [String]
    {
        let
        symbols          = codes.map { self.symbolFromAsciiCode($0) },
        symbolImages     = symbols.map { UIImage.imageOfSymbol($0, self.font) },
        whitePixelCounts = symbolImages.map { self.countWhitePixelsInImage($0) },
        sortedSymbols    = sortByIntensity(symbols, whitePixelCounts)
        return sortedSymbols
    }
    
    fileprivate func symbolFromAsciiCode(_ code: Int) -> String
    {
        return String(Character(UnicodeScalar(code)!))
    }
    
    fileprivate func countWhitePixelsInImage(_ image: UIImage) -> Int
    {
        let
        dataProvider = image.cgImage?.dataProvider,
        pixelData    = dataProvider?.data,
        pixelPointer = CFDataGetBytePtr(pixelData),
        byteCount    = CFDataGetLength(pixelData),
        pixelOffsets = stride(from: 0, to: byteCount, by: Pixel.bytesPerPixel)
        return pixelOffsets.reduce(0) { (count, offset) -> Int in
            let
            r = pixelPointer?[offset + 0],
            g = pixelPointer?[offset + 1],
            b = pixelPointer?[offset + 2],
            isWhite = (r == 255) && (g == 255) && (b == 255)
            return isWhite ? count + 1 : count
        }
    }
    
    fileprivate func sortByIntensity(_ symbols: [String], _ whitePixelCounts: [Int]) -> [String]
    {
        let
        mappings      = NSDictionary(objects: symbols, forKeys: whitePixelCounts as [NSCopying]),
        uniqueCounts  = Set(whitePixelCounts),
        sortedCounts  = uniqueCounts.sorted(),
        sortedSymbols = sortedCounts.map { mappings[$0] as! String }
        return sortedSymbols
    }
}

class Pixel
{
    /** The number of bytes a pixel occupies. 1 byte per channel (RGBA). */
    static let bytesPerPixel = 4
    
    fileprivate let offset: Int
    fileprivate init(_ offset: Int) { self.offset = offset }
    
    static func createPixelMatrix(_ width: Int, _ height: Int) -> [[Pixel]]
    {
        return (0..<height).map { row in
            (0..<width).map { col in
                let offset = (width * row + col) * Pixel.bytesPerPixel
                return Pixel(offset)
            }
        }
    }
    
    func intensityFromPixelPointer(_ pointer: UnsafePointer<UInt8>) -> Double
    {
        let
        red   = pointer[offset + 0],
        green = pointer[offset + 1],
        blue  = pointer[offset + 2]
        return Pixel.calculateIntensity(red, green, blue)
    }
    
    fileprivate static func calculateIntensity(_ r: UInt8, _ g: UInt8, _ b: UInt8) -> Double
    {
        // Normalize the pixel's grayscale value to between 0 and 1.
        // Weights from http://en.wikipedia.org/wiki/Grayscale#Luma_coding_in_video_systems
        let
        redWeight   = 0.229,
        greenWeight = 0.587,
        blueWeight  = 0.114,
        weightedMax = 255.0 * redWeight   +
                      255.0 * greenWeight +
                      255.0 * blueWeight,
        weightedSum = Double(r) * redWeight   +
                      Double(g) * greenWeight +
                      Double(b) * blueWeight
        return weightedSum / weightedMax
    }
}
