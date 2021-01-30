//
//  Binding.extensions.swift
//  WidgetFetch
//
//  Created by Tyler Poole on 1/29/21.
//

import SwiftUI

extension Binding where Value == Bool? {
    func onNone(_ fallback: Bool) -> Binding<Bool> {
        return Binding<Bool>(get: {
            return self.wrappedValue ?? fallback
        }) { value in
            self.wrappedValue = value
        }
    }
}
