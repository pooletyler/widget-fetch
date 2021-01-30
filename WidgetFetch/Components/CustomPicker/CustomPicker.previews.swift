//
//  CustomPicker.previews.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/29/21.
//

import SwiftUI

struct CustomPicker_Previews: PreviewProvider {
    @State static var selection = "Custom Option 1"
    
    static var previews: some View {
        CustomPicker(selection: $selection, label: "Custom Picker", options: ["Custom Option 1", "Custom Option 2", "Custom Option 3"])
    }
}

