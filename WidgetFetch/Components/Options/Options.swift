//
//  Options.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/28/21.
//

import SwiftUI

struct Options: View {
    @EnvironmentObject var optionsModelData: OptionsModelData
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Text("IMAGE TYPE: ")
                Spacer()
                Picker(selection: $optionsModelData.imageOptions, label: Text("IMAGE TYPE:")) {
                    ForEach(0..<optionsModelData.imageOptionsRange.count) { index in
                        Text(optionsModelData.imageOptionsRange[index].uppercased()).tag(optionsModelData.imageOptionsRange[index])
                    }
                }
                .pickerStyle(RadioGroupPickerStyle())
                .labelsHidden()
            }
            
            if optionsModelData.imageOptions == "ASCII" {
                Text("ASCII PICKER WOULD GO HERE")
            } else {
                Text("IMAGE PICKER WOULD GO HERE")
            }
            
            ForEach(Array(optionsModelData.options.keys.sorted(by: <).enumerated()), id:\.element) { _, option in
                HStack() {
                    Text(option.uppercased())
                    Spacer()
                    Toggle(option.uppercased(), isOn: $optionsModelData.options[option].onNone(false))
                        .toggleStyle(SwitchToggleStyle())
                        .labelsHidden()
                }
            }
            
        }
    }
}

extension Binding where Value == Bool? {
    func onNone(_ fallback: Bool) -> Binding<Bool> {
        return Binding<Bool>(get: {
            return self.wrappedValue ?? fallback
        }) { value in
            self.wrappedValue = value
        }
    }
}

struct Options_Previews: PreviewProvider {
    static var previews: some View {
        Options()
            .environmentObject(OptionsModelData())
    }
}

