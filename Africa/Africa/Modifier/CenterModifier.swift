//
//  CenterModifier.swift
//  Africa
//
//  Created by Rodrigo Conte on 02/02/24.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
