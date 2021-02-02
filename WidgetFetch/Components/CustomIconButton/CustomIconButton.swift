//
//  CustomIconButton.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 2/1/21.
//

import SwiftUI

struct CustomIconButton: View {
    let onButtonTap: () -> Void
    let label: String
    let backgroundImage: Image?
    let icon: Image
    
    var body: some View {
        Button(action: self.onButtonTap, label: {
            Text(self.label)
                .bold()
                .font(.system(size: 24))
        })
        .buttonStyle(CustomIconButtonStyle(backgroundImage: self.backgroundImage, icon: icon))
    }
}

