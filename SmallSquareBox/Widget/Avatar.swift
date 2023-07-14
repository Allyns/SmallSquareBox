//
//  Avatar.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import SwiftUI

struct Avatar: View {
    let url: String
    var size: CGFloat?
    
    var body: some View {
        Image(allImages[Int(arc4random()) % 24]) .resizable().clipShape(Circle())
    }
}


struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(url: "https://tfs.alipayobjects.com/images/partner/T1Lh8fXaXuXXXXXXXX")
        
        Avatar(url: "https://tfs.alipayobjects.com/images/partner/T1Lh8fXaXuXXXXXXXX", size: 100)
    }
}

