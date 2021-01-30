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
    
    var body: some View {
        HStack() {
            Toggle(isOn: $isOn, label: {
                Image(systemName: self.icon)
                Text(self.label)
            })
            .padding()
            .toggleStyle(CustomToggleStyle())
        }
    }
}
