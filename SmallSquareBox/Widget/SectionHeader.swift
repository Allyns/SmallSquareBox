//
//  SectionHeader.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 5).frame(width: 3, height: 20).foregroundColor(ThemeColor.secondary)
            Text(title).font(.bold(.title3)())
        }
        .padding(.leading)
    }
}



