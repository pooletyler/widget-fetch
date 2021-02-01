//
//  ImagePicker.swift
//  WidgetFetchMacOS
//
//  Created by Tyler Poole on 2/1/21.
//

import SwiftUI

struct ImagePickerUIKitBridge: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerUIKitBridge>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerUIKitBridge>) {

    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

struct ImagePicker: View {
    @Binding var image: UIImage?
    @Binding var showingPicker: Bool

    var body: some View {
        Image(uiImage: self.image ?? UIImage(systemName: "questionmark.circle.fill")!)
        .sheet(isPresented: $showingPicker, onDismiss: loadImage) {
            ImagePickerUIKitBridge(image: self.$image)
        }
    }
    
    func loadImage() {
        guard let image = self.image else { return }
        self.image = image
    }
}
