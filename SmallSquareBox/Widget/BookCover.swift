//
//  BookCover.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import SwiftUI
//import SDWebImageSwiftUI

struct BookCover: View {
    let url: String
    var width: Double?
    
    var body: some View {
//        let image = WebImage(url: URL(string: url)).placeholder {
//            Rectangle().foregroundColor(ThemeColor.lightGray)
//        }.resizable().aspectRatio(3/4, contentMode: .fit).clipped()
//        if let width = width {
//            image.frame(width: width)
//        } else {
//            image
//        }
        
        Image("data_avatar10")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(.systemGray5), lineWidth: 1))
    }
}

struct BookCover_Previews: PreviewProvider {
    static var previews: some View {
        BookCover(url: "http://img-tailor.11222.cn/bcv/big/201901031812421599.jpg", width: 170)
    }
}
