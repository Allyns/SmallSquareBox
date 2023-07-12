//
//  detailsView01.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/11.
//

import SwiftUI

struct DetailsViewMVVM: View {
    
    @State var searchTeext=""
    
    
    @State var notItems:[NoteItem]=[
        NoteItem(time: "2023.07.10", title: "笔记标题01", content: "笔记内容01"),
        NoteItem(time: "2023.07.09", title: "笔记标题02", content: "笔记内容02")]
    
    @State var showNewNoteView=false
    
    var body: some View {
        NavigationView {
            ZStack{
                if notItems.count==0{
                  nullDataView()
                }else{
                    VStack{
                        searchView()
                        NoteListView(notItems: $notItems)
                    }
                }
                newDataView()
            }.navigationBarTitle("闪念笔记",displayMode: .inline)
        }.sheet(isPresented: $showNewNoteView){
            NewNoteViewMVVM(showNewNoteView: $showNewNoteView,notItemData: $notItems)
        }
    }
    
    //list
    struct NoteListView:View{
        
        @Binding var notItems:[NoteItem]
        
        var body: some View{
            List{
                ForEach(notItems){it in
                    ItemView(item: it)
                }
            }.listStyle(InsetListStyle())
        }
    }
    
    //列表item
    struct ItemView:View{
        @ObservedObject var item : NoteItem
        
        var body: some View{
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(item.time)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Text(item.title)
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                    Text(item.content)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
            
                }
                
                Spacer()
                Button(action:{
                //点击更多事件响应
          
                }){
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                        .font(.system(size: 24))
                }
            }
       
        }
    }
    

    //搜索框
    func searchView()->some View{
        TextField("搜索内容",text: $searchTeext)
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
                    if searchTeext != "" {
                        Button(action:{
                            self.searchTeext=""
                        }){
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing,9)
                        }
                    }
                }
            )
            .padding(.horizontal,10)
        
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
                    self.showNewNoteView=true
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
        DetailsViewMVVM()
    }
}
