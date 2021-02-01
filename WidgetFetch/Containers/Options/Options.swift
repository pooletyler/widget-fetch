//
//  Options.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/28/21.
//

import SwiftUI

struct Options: View {
    @EnvironmentObject var optionsObservableObject: OptionsObservableObject
    @State var image: UIImage?
    @State var showingPicker: Bool = true
    
    @ViewBuilder
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Options:")
                        .bold()
                        .font(.system(size: 48))
                }
                .frame(width: 400, height: 50, alignment: .leading)
                
                CustomPicker(selection: $optionsObservableObject.imageSelections, label: "Image Type", icon: "photo.fill", options: optionsObservableObject.imageOptionsRange)
                    .padding()
                    .onChange(of: optionsObservableObject.imageSelections) { [prevSelections = optionsObservableObject.imageSelections] newSelections in
                        if newSelections["ASCII"] == false && newSelections["Image"] == false {
                            if prevSelections["ASCII"] == true {
                                optionsObservableObject.imageSelections["ASCII"] = true
                            } else {
                                optionsObservableObject.imageSelections["Image"] = true
                            }
                        } else if prevSelections["ASCII"] == true && newSelections["Image"] == true {
                            optionsObservableObject.imageSelections["ASCII"] = false
                        } else if prevSelections["Image"] == true && newSelections["ASCII"] == true {
                            optionsObservableObject.imageSelections["Image"] = false
                        }
                    }
                
                if optionsObservableObject.imageSelections["ASCII"] == true {
                    Text("ASCII PICKER WOULD GO HERE")
                } else {
                    ImagePicker(image: $image, showingPicker: $showingPicker)
                }
                
                ForEach(optionsObservableObject.optionsRange, id:\.self) { option in
                    CustomToggle(isOn: $optionsObservableObject.optionsSelections[option].onNone(false), label: option, icon: optionsObservableObject.optionsIcons[option] ?? "questionmark.circle.fill", width: 400)
                        .padding()
                }
            }
        }
    }
}