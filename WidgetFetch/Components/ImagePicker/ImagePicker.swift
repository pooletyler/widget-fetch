//
//  ImagePicker.swift
//  WidgetFetchMacOS
//
//  Created by Tyler Poole on 2/1/21.
//

import SwiftUI

struct ImagePicker: View {
    @Binding var image: UIImage?
    @Binding var showingImagePicker: Bool
    let onButtonTap: () -> Void
    let onSheetDismiss: () -> Void
    
    var body: some View {
        CustomIconButton(onButtonTap: self.onButtonTap, label: "Pick an Image", backgroundImage: unwrapImage(image: self.image), icon: Image(systemName: "photo.on.rectangle.angled"))
            .sheet(isPresented: $showingImagePicker, onDismiss: self.onSheetDismiss) {
                ImagePickerUIKitBridge(image: self.$image)
            }
    }
    
    func unwrapImage(image: UIImage?) -> Image? {
        guard let image = image else { return nil }
        return Image(uiImage: image)
    }
}
