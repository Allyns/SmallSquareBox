//
//  Avatar.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import SwiftUI
//import SDWebImageSwiftUI

struct Avatar: View {
    let url: String
    var size: CGFloat?
    
    var body: some View {
//        let content = WebImage(url: URL(string: url)).resizable().clipShape(Circle())
//        if let size = size {
//            content.frame(width: size, height: size)
//        } else {
//            content
//        }
        Image("data_avatar10")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(.systemGray5), lineWidth: 1))
    }
}





struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(url: "https://tfs.alipayobjects.com/images/partner/T1Lh8fXaXuXXXXXXXX")
        
        Avatar(url: "https://tfs.alipayobjects.com/images/partner/T1Lh8fXaXuXXXXXXXX", size: 100)
    }
}

