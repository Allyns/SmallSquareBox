//
//  CommentCell.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import SwiftUI

struct CommentCell: View {
    let comment: BookComment
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Avatar(url: comment.userPhoto, size: Drawing.avatarSize)
            VStack(alignment: .leading, spacing: 10) {
                Text(comment.nickName).foregroundColor(ThemeColor.dimGray).frame(height: Drawing.avatarSize, alignment: .center)
                Text(comment.text)
            }
        }.padding()
    }
    
    private struct Drawing {
        static let avatarSize = 35.0
    }
}
