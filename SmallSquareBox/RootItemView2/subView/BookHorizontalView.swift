//
//  BookHorizontalView.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import SwiftUI

struct BookHorizontalView: View {
    let books: [Book]
    
    var body: some View {
        LazyVStack {
            ForEach(books) { book in
                BookCell(book: book)
            }
        }.padding(EdgeInsets.init(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}
