//
//  ContentView.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/28/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Options()
            .environmentObject(OptionsModelData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
