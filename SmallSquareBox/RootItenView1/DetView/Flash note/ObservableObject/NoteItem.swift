//
//  NoteItem.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/11.
//

import SwiftUI
//遵循ObservableObject可被观察对象协议
class NoteItem : ObservableObject,Identifiable{
    var id=UUID()
    //在ObservableObject协议需要使用@Published定义
    @Published var time:String=""
    @Published var title:String=""
    @Published var content:String=""
    
    //初始化
    init(id: UUID = UUID(), time: String, title: String, content: String) {
        self.id = id
        self.time = time
        self.title = title
        self.content = content
    }
}
