//
//  CopyrightView.swift
//  Africa
//
//  Created by Nilam Shah on 06/12/23.
//

import SwiftUI

struct CopyrightView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
            Copyright © Nilam Shah
            All Rights Reserved
            Better Apps ♡ Less code
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
            
        }
        .padding()
        .opacity(0.4)
        //open character viewer cmd + Option + space
    }
}

#Preview {
    CopyrightView()
}
