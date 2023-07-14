//
//  TopBarView.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//


import SwiftUI

struct TopBarView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    let titles: [String]
    @Binding var selection: Int
    
    @ViewBuilder
    func itemView(title: String, index: Int) -> some View {
        let isSelected = (index == selection)
        Button {
            selection = index
        } label: {
            VStack(spacing: 5.0) {
                Text(title).font(.title3).foregroundColor(isSelected ? ThemeColor.darkGray : ThemeColor.dimGray)
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 20, height: 4)
                    .foregroundColor(ThemeColor.blue)
                    .opacity(isSelected ? 1 : 0)
            }.frame(maxWidth:.infinity)
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            BlurView(blurEffect: UIBlurEffect(style: .systemThinMaterial)).frame(height: Screen.navigationBarHeight)
            HStack {
                Spacer().frame(maxWidth:.infinity)
                ForEach(0..<titles.count, id: \.self) { idx in
                    itemView(title: titles[idx], index: idx)
                }
                Spacer().frame(maxWidth:.infinity)
            }.padding(.bottom, 5)
        }
    }
}

