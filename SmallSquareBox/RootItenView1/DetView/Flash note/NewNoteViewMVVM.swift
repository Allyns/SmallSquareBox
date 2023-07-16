//
//  NewNoteView.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/12.
//

import SwiftUI

struct NewNoteViewMVVM: View {

    //引入viewModel
    @EnvironmentObject var viewModel:NoteViewModel
    //单个数据
    @State var notModel:NoteModel
    //关闭弹窗
    @Environment(\.presentationMode)var presentationMode
    
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                titleInputView()
                Divider()
                contentView()
            }.navigationBarTitle(viewModel.isAdd ? "新建笔记" : "编辑笔记",displayMode: .inline)
            .navigationBarItems(leading: closeView(), trailing: saveView())
            .toase(present: $viewModel.showToast, message: $viewModel.showToasMessage)
        }
    }
    
    
    //内容输入
    func contentView()->some View{
        ZStack(alignment: .topLeading) {
            TextEditor(text: viewModel.isAdd ? $viewModel.content : $notModel.content)
                .font(.system(size: 16))
                .padding()
            if viewModel.isAdd ? (viewModel.content.isEmpty) : (notModel.content.isEmpty) {
                Text("请输入内容")
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(20)
            }
        }
    }
    
    //标题输入框
    func titleInputView()->some View{
        TextField("请输入标题",text: viewModel.isAdd ? $viewModel.title : $notModel.title,onEditingChanged: {changed in
            self.viewModel.isSearching=changed
        }).padding()
        
    }
    
    //关闭按钮
    func closeView()->some View{
        Button(action:{
            self.viewModel.showNewView=false
        }){
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
    }
    
    //保存按钮
    func saveView()->some View{
        Button(action:{
            if viewModel.isAdd {
                if viewModel.isTextEmpty(text: viewModel.title) {
                    viewModel.showToast=true
                    viewModel.showToasMessage="请输入标题"
                } else if viewModel.isTextEmpty(text: viewModel.content){
                    viewModel.showToast=true
                    viewModel.showToasMessage="请输入内容"
                }else{
                    self.viewModel.addItem(time: viewModel.getCurrentTime(), title: viewModel.title, content: viewModel.content)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }else{
                if viewModel.isTextEmpty(text: notModel.title) {
                    viewModel.showToast=true
                    viewModel.showToasMessage="请输入标题"
                }else if viewModel.isTextEmpty(text: notModel.content){
                    viewModel.showToast=true
                    viewModel.showToasMessage="请输入内容"
                }else{
                    self.viewModel.editItem(item: notModel)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }){
         Text("完成")
                .font(.system(size: 17))
        }
    }
    
}

struct NewNoteViewMVVM_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteViewMVVM(notModel: NoteModel(time: "", title: "", content: "")).environmentObject(NoteViewModel())
    }
}
