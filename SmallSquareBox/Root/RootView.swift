//
//  RootView.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/10.
//

import SwiftUI

struct RootView: View{
    
   @State private var selection:Int=0
    
    var body:some View{
    
        NavigationView{
            TabView(selection: $selection){
                HomeView1().tabItem{Item(type: .view1, select:selection)}.tag(ItemType.view1.rawValue)
                HomeView2().tabItem{Item(type: .view2, select: selection)}
                    .tag(ItemType.view2.rawValue)
            HomeView3().tabItem{Item(type: .view3, select: selection)}
                    .tag(ItemType.view3.rawValue)
                HomeView4().tabItem{Item(type: .view4, select: selection)}.tag(ItemType.view4.rawValue)
            }.navigationBarHidden(itemType.isNavigationBarHidden(selection: selection))
                .navigationBarTitle(itemType.title,displayMode: .inline)
                .navigationBarItems(trailing: itemType.navigationBarTrailingItems(selection: selection))
        }
        
    }
    
    
    enum ItemType:Int{
        case view1
        case view2
        case view3
        case view4
        //图标
        var image:Image{
            switch self{
            case .view1: return Image("root_tab_chat")
            case .view2: return Image("root_tab_contact")
            case .view3: return Image("root_tab_discover")
            case .view4: return Image("root_tab_me")
            }
        }
        
        var selectedImage:Image{
            switch self{
            case .view1: return Image("root_tab_chat_selected")
            case .view2: return Image("root_tab_contact_selected")
            case .view3: return Image("root_tab_discover_selected")
            case .view4: return Image("root_tab_me_selected")
            }
        }
        
        var title:String{
            switch self{
            case .view1:return "‘小’程序"
            case .view2:return "界面2"
            case .view3:return "界面3"
            case .view4:return "我的"
            }
        }
        
        //设置隐藏顶部导航栏
        func isNavigationBarHidden(selection:Int)-> Bool{
            selection == ItemType.view4.rawValue
        }
        //设置顶部导航栏右边图标
        func navigationBarTrailingItems(selection:Int)->AnyView{
            switch ItemType(rawValue: selection)!{
            case .view1:
                return AnyView(Image(systemName: "plus.circle"))
            case .view2:
                return AnyView(Image(systemName: "person.badge.plus"))
            case.view3:
                return AnyView(EmptyView())
            case.view4:
                return AnyView(EmptyView())
            }
        }
        
    }
    //设置每一个item
    struct Item :View{
        let type:ItemType
        let select:Int
        
        var body: some View{
            VStack{
                if(type.rawValue==select){
                    type.selectedImage
                }else{
                    type.image
                }
                Text(type.title)
            }
        }
    }
    
    //拿到itemType对象实例
    private var itemType:ItemType{
        ItemType(rawValue: selection)!
    }
}


struct RootView_previews:PreviewProvider{
   static var previews :some View{
        RootView()
    }
}
