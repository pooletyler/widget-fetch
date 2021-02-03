//
//  ImagePicker.classes.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 2/1/21.
//

import UIKit

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let parent: ImagePickerUIKitBridge

    init(_ parent: ImagePickerUIKitBridge) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let uiImage = info[.originalImage] as? UIImage {
            parent.image = uiImage
        }

        parent.presentationMode.wrappedValue.dismiss()
    }
}
