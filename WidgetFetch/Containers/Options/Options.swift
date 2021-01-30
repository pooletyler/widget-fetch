//
//  Options.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/28/21.
//

import SwiftUI

struct Options: View {
    @EnvironmentObject var optionsObservableObject: OptionsObservableObject
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .center) {
            CustomPicker(selection: $optionsObservableObject.imageSelections, label: "Image Type", options: optionsObservableObject.imageOptionsRange)
            
            if optionsObservableObject.imageSelections == "ASCII" {
                Text("ASCII PICKER WOULD GO HERE")
            } else {
                Text("IMAGE PICKER WOULD GO HERE")
            }
            
            ForEach(optionsObservableObject.optionsRange, id:\.self) { option in
                CustomToggle(isOn: $optionsObservableObject.optionsSelections[option].onNone(false), label: option, icon: optionsObservableObject.optionsIcons[option] ?? "questionmark.circle.fill")
            }
            
        }
    }
}
