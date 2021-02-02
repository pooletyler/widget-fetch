//
//  CustomIconButton.styles.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 2/1/21.
//

import SwiftUI

struct CustomIconButtonStyle: ButtonStyle {
    let backgroundImage: Image?
    let icon: Image
    
    @ViewBuilder
    public func makeBody(configuration: CustomIconButtonStyle.Configuration) -> some View {
        VStack() {
            ZStack() {
                if backgroundImage != nil {
                    backgroundImage?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10.0)
                } else {
                    Rectangle()
                        .fill(Color.fromHex(hex: DarkMode.white, alpha: 0.1))
                        .frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10.0)
                }
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .foregroundColor(Color.fromHex(hex: DarkMode.white))
            }
            
            Spacer()
            
            configuration.label
        }
        .frame(width: 400, height: 450, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

    }
}
