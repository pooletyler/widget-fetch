//
//  Options.previews.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/29/21.
//

import SwiftUI

struct Options_Previews: PreviewProvider {
    static var previews: some View {
        Options()
            .environmentObject(OptionsObservableObject())
    }
}
