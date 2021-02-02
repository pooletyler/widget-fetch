//
//  ImagePicker.wrapped.swift
//  WidgetFetch
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
