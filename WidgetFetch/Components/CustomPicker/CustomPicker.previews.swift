//
//  CustomPicker.previews.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/29/21.
//

import SwiftUI

struct CustomPicker_Previews: PreviewProvider {
    @State static var selection = [
        "Custom Option 1": true,
        "Custom Option 2": false,
        "Custom Option 3": false,
        ]
    
    static var previews: some View {
        CustomPicker(selection: $selection, label: "Custom Picker", icon: "questionmark.circle.fill", options: ["Custom Option 1", "Custom Option 2", "Custom Option 3"])
    }
}

