//
//  BookCover.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import SwiftUI



struct BookCover: View {
    let url: String
    var width: CGFloat?
    
    var body: some View {
        VStack{
            Image(allImages[Int(arc4random()) % 24]).resizable().clipped().frame(width: width,height: width)
         .aspectRatio(3/4, contentMode: .fit)
        }
    }
}

struct BookCover_Previews: PreviewProvider {
    static var previews: some View {
        BookCover(url: "http://img-tailor.11222.cn/bcv/big/201901031812421599.jpg", width: 170)
    }
}
