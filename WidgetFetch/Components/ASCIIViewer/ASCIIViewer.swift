//
//  ASCIIEditor.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 2/3/21.
//

import SwiftUI

struct ASCIIEditor: View {
    @State private var text = "type something..."
    
    var body: some View {
        TextEditor(text: $text)
            .font(.system(size: 6, weight: .bold, design: .default))
            .background(Color.fromHex(hex: DarkMode.white, alpha: 0.1))
            .foregroundColor(Color.fromHex(hex: DarkMode.white))
            .frame(width: 400, height: 400, alignment: .center)
            .cornerRadius(10.0)
    }
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
}
