//
//  Options.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/28/21.
//

import SwiftUI

struct Options: View {
    @EnvironmentObject var optionsModelData: OptionsModelData
    let imageOptionsRange = ["ASCII", "Image"]
    let optionsRange = [
        "User",
        "OS",
        "Host",
        "Kernel",
        "Uptime",
        "Packages",
        "Shell",
        "Resolution",
        "DE",
        "VM",
        "WM Theme",
        "Terminal",
        "Terminal Font",
        "CPU",
        "GPU",
        "Memory",
        "Swatch"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Text("IMAGE TYPE: ")
                Spacer()
                Picker(selection: $optionsModelData.imageType, label: Text("IMAGE TYPE:")) {
                    ForEach(0..<imageOptionsRange.count) { index in
                        Text(self.imageOptionsRange[index].uppercased()).tag(self.imageOptionsRange[index])
                    }
                }
                .pickerStyle(RadioGroupPickerStyle())
                .labelsHidden()
            }
            ForEach(0..<optionsRange.count) { index in
                HStack() {
                    Text(self.optionsRange[index].uppercased())
                    Spacer()
                    Toggle(self.optionsRange[index].uppercased(), isOn: $optionsModelData.options[index])
                        .toggleStyle(SwitchToggleStyle())
                        .labelsHidden()
                }
            }
            
        }
    }
}

struct Options_Previews: PreviewProvider {
    static var previews: some View {
        Options()
            .environmentObject(OptionsModelData())
    }
}

