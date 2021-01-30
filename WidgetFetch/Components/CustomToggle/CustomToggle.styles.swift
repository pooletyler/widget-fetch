//
//  CustomToggle.styles.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/29/21.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    var color: Color = .green
    
    public func makeBody(configuration: CustomToggleStyle.Configuration) -> some View {
        HStack(alignment: .center) {
            configuration.label
            
            Spacer()
            
            Image(systemName: configuration.isOn ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? Color.fromHex(hex: DarkMode.red, alpha: 1) : Color.fromHex(hex: DarkMode.lightBlack, alpha: 1))
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
        .frame(width: 250, height: 30)
    }
}
