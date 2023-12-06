//
//  CenterModifier.swift
//  Africa
//
//  Created by Nilam Shah on 06/12/23.
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
