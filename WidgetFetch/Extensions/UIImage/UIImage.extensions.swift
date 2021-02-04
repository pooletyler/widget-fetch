//
//  UIImage.extensions.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 2/3/21.
//

import AVFoundation
import Foundation
import UIKit

extension UIImage
{
    class func imageOfSymbol(_ symbol: String, _ font: UIFont) -> UIImage
    {
        let
            length = font.pointSize * 2,
            size   = CGSize(width: length, height: length),
            rect   = CGRect(origin: CGPoint.zero, size: size)
        
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        
        // Fill the background with white.
        context?.setFillColor(UIColor.white.cgColor)
        context?.fill(rect)
        
        // Draw the character with black.
        let nsString = NSString(string: symbol)
        nsString.draw(at: rect.origin, withAttributes: convertToOptionalNSAttributedStringKeyDictionary([
            convertFromNSAttributedStringKey(NSAttributedString.Key.font): font,
            convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.black
        ]))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    /// Represents a scaling mode
    enum ScalingMode {
        case aspectFill
        case aspectFit

        /// Calculates the aspect ratio between two sizes
        ///
        /// - parameters:
        ///     - size:      the first size used to calculate the ratio
        ///     - otherSize: the second size used to calculate the ratio
        ///
        /// - return: the aspect ratio between the two sizes
        func aspectRatio(between size: CGSize, and otherSize: CGSize) -> CGFloat {
            let aspectWidth  = size.width/otherSize.width
            let aspectHeight = size.height/otherSize.height

            switch self {
            case .aspectFill:
               return max(aspectWidth, aspectHeight)
            case .aspectFit:
                return min(aspectWidth, aspectHeight)
            }
        }
    }

    /// Scales an image to fit within a bounds with a size governed by the passed size. Also keeps the aspect ratio.
    ///
    /// - parameter:
    ///     - newSize:     the size of the bounds the image must fit within.
    ///     - scalingMode: the desired scaling mode
    ///
    /// - returns: a new scaled image.
    func scaled(to newSize: CGSize, scalingMode: UIImage.ScalingMode = .aspectFill) -> UIImage {
        
        let aspectRatio = scalingMode.aspectRatio(between: newSize, and: size)
        
        /* Build the rectangle representing the area to be drawn */
        var scaledImageRect = CGRect.zero

        scaledImageRect.size.width  = size.width * aspectRatio
        scaledImageRect.size.height = size.height * aspectRatio
        scaledImageRect.origin.x    = (newSize.width - size.width * aspectRatio) / 2.0
        scaledImageRect.origin.y    = (newSize.height - size.height * aspectRatio) / 2.0

        /* Draw and retrieve the scaled image */
        UIGraphicsBeginImageContext(newSize)

        draw(in: scaledImageRect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return scaledImage!
    }
    
    fileprivate func degreesToRotate() -> Double
    {
        switch self.imageOrientation
        {
        case .right: return  90
        case .down:  return 180
        case .left:  return -90
        default:     return   0
        }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}
