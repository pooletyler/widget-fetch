//
//  CustomToggle.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/29/21.
//

import SwiftUI

struct CustomToggle: View {
    @Binding var isOn: Bool
    let label: String
    let icon: String
    let width: CGFloat
    
    var body: some View {
        HStack() {
            Toggle(isOn: $isOn, label: {
                Image(systemName: self.icon)
                Text(self.label)
                    .bold()
            })
            .toggleStyle(CustomToggleStyle(width: self.width))
        }
    }
}
