//
//  DeferNavigationLink.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import SwiftUI

struct DeferNavigationLink<Label: View, Destination: View>: View {
    @State private var isLinkActive = false
    
    let label: () -> Label
    let destination: () -> Destination
    
    init(destination: @escaping () -> Destination, @ViewBuilder label: @escaping () -> Label) {
        self.label = label
        self.destination = destination
    }

    var body: some View {
        ZStack {
            NavigationLink(destination: DeferView(destination), isActive: $isLinkActive) { EmptyView() }
            Button {
                isLinkActive = true
            } label: {
                label()
            }
        }
    }
}

