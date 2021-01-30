//
//  CustomToggle.previews.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/29/21.
//

import SwiftUI

struct CustomToggle_Previews: PreviewProvider {
    @State static var isOn = true
    
    static var previews: some View {
        CustomToggle(isOn: $isOn, label: "Custom Toggle", icon: "questionmark.circle.fill")
    }
}

