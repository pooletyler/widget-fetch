//
//  ImagePicker.previews.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 2/1/21.
//

import SwiftUI

struct ImagePicker_Previews: PreviewProvider {
    @State static var image: UIImage?
    @State static var showingPicker: Bool = true
    
    static var previews: some View {
        ImagePicker(image: $image, showingPicker: $showingPicker)
    }
}
