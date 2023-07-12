//
//  NewNoteView.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/12.
//

import SwiftUI

struct NewNoteView: View {
    @State var title:String=""
    @State var isEditing=false
    
    @State var content:String=""
    
    @Binding var showNewNoteView: Bool
    
    @Binding var notItemData:[NoteItem]
    
    
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                titleInputView()
                Divider()
                contentView()
            }.navigationBarTitle("新建笔记",displayMode: .inline)
                .navigationBarItems(leading: closeView(), trailing: saveView())
        }
    }
    
    
    //内容输入
    func contentView()->some View{
        ZStack(alignment: .topLeading) {
            TextEditor(text: $content)
                .font(.system(size: 16))
                .padding()
            if content==""{
                Text("请输入内容")
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(20)
            }
        }
    }
    
    //标题输入框
    func titleInputView()->some View{
        TextField("请输入标题",text: $title,onEditingChanged: {changed in
            self.isEditing=changed
        }).padding()
        
    }
    
    //关闭按钮
    func closeView()->some View{
        Button(action:{
            self.showNewNoteView=false
        }){
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
    }
    //保存按钮
    func saveView()->some View{
        Button(action:{
            addData(time: getCurrentTime(), title: title, content: content)
            self.showNewNoteView=false
        }){
         Text("完成")
                .font(.system(size: 17))
        }
    }
    
    //新建笔记
    func addData(time:String,title:String,content:String){
        let data=NoteItem(time: time, title: title, content: content)
        notItemData.append(data)
    }
    
    // 获取当前系统时间
    func getCurrentTime()->String{
        let dateformatter=DateFormatter()
        dateformatter.dateFormat="YY.MM.dd"
        return dateformatter.string(from: Date())
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView(showNewNoteView: .constant(true),notItemData: .constant([]))
    }
}
