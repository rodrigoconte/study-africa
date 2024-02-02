//
//  CreditsView.swift
//  Africa
//
//  Created by Rodrigo Conte on 02/02/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
            Copyright © Rodrigo Conte
            All rights reserved
            Better apps ♡ less code
            """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    CreditsView()
}
