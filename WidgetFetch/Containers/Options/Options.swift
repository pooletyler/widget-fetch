//
//  Options.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/28/21.
//

import SwiftUI

struct Options: View {
    @EnvironmentObject var optionsObservableObject: OptionsObservableObject
    @State var palette: ASCIIPaletteProvider = ASCIIPaletteProvider(font: UIFont(name: "Menlo", size: 7)!)
    
    @ViewBuilder
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Options:")
                        .bold()
                        .font(.system(size: 48))
                }
                .frame(width: 400, height: 50, alignment: .leading)
                
                CustomPicker(selection: $optionsObservableObject.imageSelections, label: "Image Type", icon: "photo.fill", options: optionsObservableObject.imageOptionsRange)
                    .padding()
                    .onChange(of: optionsObservableObject.imageSelections) { [prevSelections = optionsObservableObject.imageSelections] newSelections in
                        if newSelections["ASCII"] == false && newSelections["Image"] == false {
                            if prevSelections["ASCII"] == true {
                                optionsObservableObject.imageSelections["ASCII"] = true
                            } else {
                                optionsObservableObject.imageSelections["Image"] = true
                            }
                        } else if prevSelections["ASCII"] == true && newSelections["Image"] == true {
                            optionsObservableObject.imageSelections["ASCII"] = false
                        } else if prevSelections["Image"] == true && newSelections["ASCII"] == true {
                            optionsObservableObject.imageSelections["Image"] = false
                        }
                    }
                
                if optionsObservableObject.imageSelections["ASCII"] == true {
                    LazyVStack(spacing: 10) {
                        RepresentedUILabelView(attributedText: getASCIIImage(image: optionsObservableObject.image))
                            .fixedSize(horizontal: true, vertical: true)
                            .scaleEffect(x: 3.25, y: 0.95)
                    }
                    .frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .cornerRadius(10.0)
                } else {
                    ImagePicker(image: $optionsObservableObject.image, showingImagePicker: $optionsObservableObject.showingImagePicker, onButtonTap: onImagePickerButtonTap, onSheetDismiss: onImagePickerSheetDismiss)
                        .padding()
                    
                }
                
                ForEach(optionsObservableObject.optionsRange, id:\.self) { option in
                    CustomToggle(isOn: $optionsObservableObject.optionsSelections[option].onNone(false), label: option, icon: optionsObservableObject.optionsIcons[option] ?? "questionmark.circle.fill", width: 400)
                        .padding()
                }
            }
        }
    }
    
    struct RepresentedUILabelView: UIViewRepresentable {
        typealias UIViewType = UILabel
        
        var attributedText: NSAttributedString
        
        func makeUIView(context: Context) -> UILabel {
            let labelFont = UIFont(name: "Menlo", size: 0.54)!
            let label = UILabel()
            
            label.font = labelFont
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.textAlignment = .justified
            label.allowsDefaultTighteningForTruncation = true
            
            // Compression resistance is important to enable auto resizing of this view,
            // that base on the SwiftUI layout.
            // Especially when the SwiftUI frame modifier applied to this view.
            label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
            
            return label
        }
        
        func updateUIView(_ uiView: UILabel, context: Context) {
            uiView.attributedText = attributedText
        }
        
    }
    
    func onImagePickerButtonTap() {
        optionsObservableObject.showingImagePicker = true
    }
    
    func onImagePickerSheetDismiss() {
        guard let image = optionsObservableObject.image else { return }
        optionsObservableObject.image = image
    }
    
    func getASCIIImage(image: UIImage?) -> NSAttributedString {
        var image = optionsObservableObject.image ?? UIImage(named: "apple.jpg")!
        image = image.scaled(to: CGSize.init(width: 400, height: 400))

        
        let asciiString = ASCIIArtProvider(image, self.palette)
        let asciiImage = asciiString.createAsciiArt()
        
        return makeAttributedString(fromString: asciiImage)
    }
    
    func makeAttributedString(fromString s: String) -> NSAttributedString {
        let content = NSMutableAttributedString(string: s)
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = .justified
        paraStyle.lineHeightMultiple = 1.25
        paraStyle.lineBreakMode = .byTruncatingTail
        paraStyle.hyphenationFactor = 1.0
        
        content.addAttribute(.paragraphStyle,
                             value: paraStyle,
                             range: NSMakeRange(0, s.count))
        
        return content
    }
}
