//
//  ViewModel.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/12.
//

import Foundation
/**
 ViewModel是用来干什么的？
 简单来说，Model是声明数据模型参数的，View是用来构建页面和基础交互的，ViewModel是用来实现基础功能的，包含念头笔记的增删改查，都是在ViewModel中实现，然后在View视图中调用，做到页面和数据分开。
 而我们可以看到在ContentView首页视图和NewNoteView新建笔记视图中有很多参数是需要进行双向绑定的，如果不使用ViewModel的方式，那么页面之间都需要声明相同的参数，并做双向绑定。页面一多，那就和套娃一样，一直“回绑”。
 我们创建一个ViewModel类，并遵循ObservableObject协议
 Published  订阅监听对象
 */
class NoteViewModel:ObservableObject{
    //数据模型
    @Published var noteModeles=[NoteModel]()
    
    //薪资内容
    @Published var time:String=""
    @Published var title:String=""
    @Published var content:String=""
    @Published var searchText=""
    
    //是否正在搜索
    @Published var isSearching:Bool=false
    //是否新增
    @Published var isAdd:Bool=true
    //新建弹窗状态
    @Published var showNewView:Bool=false
    //打开编辑弹窗
    @Published var showEditView:Bool=false
    //关闭弹窗状态
    @Published var showAction:Bool=false
    //提示信息
    @Published var showToast=false
    @Published var showToasMessage:String="提示信息"
    
    
    init(){
        loadItems()
        saveItems()
    }
    
    //新增
    func addItem(time:String,title:String,content:String){
        let newItem=NoteModel(time: time, title: title, content: content)
        noteModeles.append(newItem)
        saveItems()
    }
    
    //获取数据id
    func getItemById(itemId:UUID)->NoteModel?{
        return noteModeles.first(where: {it in
            it.id==itemId
        }) ?? nil
    }
    
    //删除
    func deleteItem(itemId:UUID){
        noteModeles.removeAll(where: { it in
            it.id == itemId
        })
        saveItems()
    }
    //编辑
    func editItem(item:NoteModel){
        if let id=noteModeles.firstIndex(where: {it in it.id==item.id}){
            noteModeles[id]=item
            saveItems()
        }
    }
    
    //搜索笔记
    func searchContent(){
        let query=searchText.lowercased()
        //开启后台线程
        DispatchQueue.global(qos: .background).async {
            let filteer=self.noteModeles.filter{it in
                it.content.lowercased().contains(query)
            }
            DispatchQueue.main.async {
                self.noteModeles=filteer
            }
        }
    }
    
    //获取设备上的文档目录路径
    func docmentsDirectory() ->URL{
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    //获取plist数据文件的路径
    func dataFilePath()->URL{
        docmentsDirectory().appendingPathComponent("ideaNote.plist")
    }
    
    //数据写入本地存储
    func saveItems(){
        let encoder=PropertyListEncoder()
        do{
            let data=try encoder.encode(noteModeles)
            try data.write(to: dataFilePath(),options: Data.WritingOptions.atomic)
        }catch{
            print("saveItems error")
        }
    }
    
    //从本地存储拿数据
    func loadItems(){
        let path=dataFilePath()
        
        if let data=try? Data(contentsOf: path){
            let decoder=PropertyListDecoder()
            do{
                noteModeles=try decoder.decode([NoteModel].self, from: data)
            }catch{
                print("error loadItems")
            }
        }
    }
 //获取当前时间
    func getCurrentTime()->String{
        let dateformatter=DateFormatter()
        dateformatter.dateFormat="YYY.MM.dd"
        return dateformatter.string(from: Date())
    }
    
    //判断是否为空
    func isTextEmpty(text:String)->Bool{
        if text=="" {
            return true
        }else{
            return false
        }
    }
    
}
