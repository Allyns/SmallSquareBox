//
//  NoteModel.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/12.
//

import Foundation
//为了使用NoteModel模型类的序列化数据，NoteModel需要遵循Codable协议。

/**
 
 为了更好说明MVVM开发模式中的Model，我们更改NoteItem模型类名称为NoteModel便于理解。参数重命名的方式为选择参数点击右键，选择Refactor，选择Rename，修改为NoteModel。
 为了使用NoteModel模型类的序列化数据，NoteModel需要遵循Codable协议。

 */
struct NoteModel:Identifiable,Codable{
    
    var id=UUID()
    var time:String
    var title:String
    var content:String
    
}
