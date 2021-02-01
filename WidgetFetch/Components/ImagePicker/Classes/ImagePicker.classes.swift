//
//  ImagePicker.classes.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 2/1/21.
//

import Foundation
import UIKit

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let parent: ImagePicker

    init(_ parent: ImagePicker) {
        self.parent = parent
    }
}
