//
//  CustomIconButton.previews.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 2/1/21.
//

import SwiftUI

struct CustomIconButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomIconButton(onButtonTap: { return }, label: "Custom Icon Button", backgroundImage: nil, icon: Image(systemName: "questionmark.circle.fill"))
    }
}
