//
//  BookHybirdView.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import SwiftUI

struct BookHybirdView: View {
    let books: [Book]
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
        
    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem()], spacing: 15) {
            ForEach(0..<books.count,id: \.self) { idx in
                BookHItemView(book: books[idx])
            }
        }.padding(EdgeInsets.init(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}

