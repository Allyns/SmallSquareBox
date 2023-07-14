//
//  BookstoreMenuView.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import SwiftUI

struct BookstoreMenuView: View {
    let menus: [MenuRead]
    
    var body: some View {
        HStack {
            ForEach(menus, id: \.title) { menu in
                VStack(spacing: 0) {
                    Image(menu.imageName)
                    Text(menu.title).font(.body).foregroundColor(.gray)
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

