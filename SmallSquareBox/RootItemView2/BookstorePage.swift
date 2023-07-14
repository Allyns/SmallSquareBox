//
//  HomeView2.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/10.
//

import SwiftUI

struct BookstorePage: View {
    
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    @State var pageIndex = 0
    let viewModel: BookstoreViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            ForEach(0..<viewModel.list.count, id: \.self) { idx in
                if idx == pageIndex  {
                    BookstoreListView(viewModel: viewModel.list[idx]).tag(idx).tag(idx)
                }
            }
            .frame(maxHeight: CGFloat.infinity)
            
            TopBarView(titles: viewModel.list.map { $0.type.title() }, selection: $pageIndex)
        }.ignoresSafeArea()
    }
    /**
          图片是随机获取本地图片，如果改成网络图片也很简单，修改ImageWithURL类，替换 Image(allImages[Int(arc4random()) % 24])即可
     
      
     */
    
}
