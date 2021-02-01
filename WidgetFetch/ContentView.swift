//
//  ContentView.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/30/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Options()
            .environmentObject(OptionsObservableObject())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
