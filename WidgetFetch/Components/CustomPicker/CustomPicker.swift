//
//  CustomPicker.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/29/21.
//

import SwiftUI

struct CustomPicker: View {
    @Binding var selection: String
    let label: String
    let options: [String]
    
    var body: some View {
        HStack() {
            Text(self.label)
            Spacer()
            Picker(selection: $selection, label: Text(self.label.uppercased())) {
                ForEach(0..<self.options.count) { index in
                    Text(self.options[index].uppercased()).tag(self.options[index])
                }
            }
            .pickerStyle(RadioGroupPickerStyle())
            .labelsHidden()
        }
    }
}

