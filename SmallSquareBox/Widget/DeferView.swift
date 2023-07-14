//
//  DeferView.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import SwiftUI

struct DeferView<Content: View>: View {
    let content: () -> Content

    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        content()          // << everything is created here
    }
}
