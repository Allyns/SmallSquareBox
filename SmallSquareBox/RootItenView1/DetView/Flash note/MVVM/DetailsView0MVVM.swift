//
//  detailsView01.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/11.
//

import SwiftUI

struct DetailsViewMVVM: View {
    
    @EnvironmentObject var viewModel:NoteViewModel
    
    var body: some View {
        NavigationView {
            ZStack{
                if viewModel.isSearching == false && viewModel.noteModeles.count==0 {
                  nullDataView()
                }else{
                    VStack{
                        searchView()
                        noteListView()
                    }
                }
                newDataView()
            }.navigationBarTitle("闪念笔记",displayMode: .inline)
        }.sheet(isPresented: $viewModel.showNewView){
            NewNoteViewMVVM(notModel: NoteModel(time: "", title: "", content: ""))
        }
    }
    
    //list
    func noteListView()-> some View{
            List{
                ForEach(viewModel.noteModeles){it in
                    ItemView(itemId: it.id)
                }
            }.listStyle(InsetListStyle())
        }

    
    //列表item
    struct ItemView:View{
        ///载入viewModel
        @EnvironmentObject var viewModel : NoteViewModel
        //获取唯一id
        var itemId:UUID
        
        //从ViewModel中获取id
        var item:NoteModel?{
            return viewModel.getItemById(itemId: itemId)
        }
        
        var body: some View{
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(item?.time ?? "")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Text(item?.title ?? "")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                    Text(item?.content ?? "")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
            
                }.onTapGesture {
                    //编辑
                    viewModel.isAdd=false
                    viewModel.showEditView=true
                }
                
                Spacer()
                Button(action:{
                //点击删除
                    viewModel.showAction=true
          
                }){
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                        .font(.system(size: 24))
                }
            }
            
            //编辑笔记弹窗
            .sheet(isPresented: $viewModel.showEditView) {
                NewNoteViewMVVM(notModel: item ?? NoteModel(time: "", title: "", content: ""))
            }
            //删除笔记确认
            .actionSheet(isPresented: $viewModel.showAction) {
                ActionSheet(title: Text("确定要删除这条笔记吗？"),
                message: nil,
                buttons: [
                    .destructive(Text("删除"),action: {
                        viewModel.deleteItem(itemId: itemId)
                    }),
                    .cancel(Text("取消")),
                ])
            }
        }
    }
    

    //搜索框
    func searchView()->some View{
        TextField("搜索内容",text: $viewModel.searchText)
            .padding()
            .padding(.horizontal,18)
            .background(Color(.systemGray6))
            .cornerRadius(9)
        //叠加视图在上方
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        .padding(.leading,9)
                    //清除按钮
                    if self.viewModel.searchText != "" {
                        Button(action:{
                            self.viewModel.searchText=""
                            self.viewModel.loadItems()
                        }){
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing,9)
                        }
                    }
                }
            )
            .padding(.horizontal,10)
            .onChange(of: viewModel.searchText) { _ in
                //搜索内容
                if viewModel.searchText != "" {
                    self.viewModel.isSearching=true
                    self.viewModel.searchContent()
                }else{
                    viewModel.searchText=""
                    self.viewModel.isSearching=false
                    self.viewModel.loadItems()
                    
                }
            }
        
    }

    func nullDataView()->some View{
        VStack(alignment: .center, spacing: 20){
            Image("discover_search").resizable()
                .scaledToFit()
                .frame(width: 80)
            Text("暂无数据，想到什么了，马上记下")
                .font(.system(size: 16
                             )).bold()
                .foregroundColor(.gray)
            
        }
    }

    func newDataView()-> some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                Button(action:{
                    //弹窗
                    self.viewModel.isAdd=true
                    self.viewModel.time=viewModel.getCurrentTime()
                    self.viewModel.title=""
                    self.viewModel.content=""
                    self.viewModel.showNewView=true
                }){
                    //视图
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 45))
                        .foregroundColor(.blue)
                    
                }
            }
        }.padding(.bottom,32)
            .padding(.trailing,32)
    }
    
}


struct detailsView01_PreviewsMVVM: PreviewProvider {
    static var previews: some View {
        DetailsViewMVVM().environmentObject(NoteViewModel())
    }
}
