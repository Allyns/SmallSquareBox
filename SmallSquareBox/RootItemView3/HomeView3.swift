//
//  HomeView3.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/10.
//
import Foundation
import SwiftUI

struct HomeView3: View {
    @State var isRefresh = false
      @State var isMore = false
      
      @State var textArr : Array<String> = []
      @State var count = 20
      
      var body: some View {
          VStack {
              /*
               offDown: 列表数据滑动总高
               listH: 列表高度
               refreshing: 下拉刷新加载UI的开关
               isMore: 加载更多UI的开关
               */
              RefreshScrollView(offDown: CGFloat(textArr.count) * 40.0, listH: ScreenH - kNavHeight - kBottomSafeHeight, refreshing: $isRefresh, isMore: $isMore) {
                  // 下拉刷新触发
                  DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                      // 刷新完成，关闭刷新
                      self.loadData()
                      isRefresh = false
                  })
              } moreTrigger: {
                  // 上拉加载更多触发
                  DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                      // 加载完成，关闭加载
                      for i in 0...10{
                          textArr.append(String("\(i + textArr.count) 下拉上拉-"+randomAlphanumericString(30)))
                      }
                      isMore = false
                  })
              } content: {
                  // 列表内容
                  VStack(spacing: 0){
                      ForEach(0..<(textArr.count),id: \.self) { index in
                          HStack(alignment:.center){
                              Text(textArr[index] ).foregroundColor(Color.black).frame(width: 300, height: 40)
                          }
                      }
                  }
              }

              Spacer()
          }.onAppear(){
              self.loadData()
          }
          .padding()
      }
      
      func loadData(){
          textArr.removeAll()
          for i in 0...count{
              textArr.append(String("\(i)下拉上拉-"+randomAlphanumericString(30)))
          }
      }
    
    func randomAlphanumericString(_ length: Int) -> String {
       let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
       var randomString = ""
       for _ in 0..<length {
          let randomIndex = Int.random(in: 0..<letters.count)
          let randomCharacter = letters[letters.index(letters.startIndex, offsetBy: randomIndex)]
          randomString.append(randomCharacter)
       }
       return randomString
    }
}

struct HomeView3_Previews: PreviewProvider {
    static var previews: some View {
        HomeView3()
    }
}
