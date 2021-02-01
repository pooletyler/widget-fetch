//
//  CustomPicker.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/29/21.
//

import SwiftUI

struct CustomPicker: View {
    @Binding var selection: [String : Bool]
    let label: String
    let icon: String
    let options: [String]
    
    var body: some View {
        HStack() {
            Image(systemName: self.icon)
            Text(self.label)
                .bold()
            Spacer()
            VStack() {
                ForEach(options, id:\.self) { option in
                    CustomToggle(isOn: $selection[option].onNone(false), label: option, icon: "", width: 250)
                }
            }
        }
        .frame(width: 400, height: 150)
    }
}

