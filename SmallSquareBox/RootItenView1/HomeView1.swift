//
//  HomeView1.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/10.
//

import SwiftUI

struct HomeView1: View {
    var itemMsg=[ItemMessage(image: "discover_game", name: "闪念笔记(ObservableObject)"),
                 ItemMessage(image: "discover_miniprogram", name: "闪念笔记(MVVM)"),
                 ItemMessage(image: "discover_moment", name: "倒计时"),
                 ItemMessage(image: "discover_nearby", name: "每日一句"),
                 ItemMessage(image: "discover_qrcode", name: "单位转换"),
                 ItemMessage(image: "discover_search", name: "今天吃什么"),
                 ItemMessage(image: "discover_see", name: "新国标红绿灯")]
    
    var body: some View {
        List(itemMsg.indices,id:\.hashValue){index in
            NavigationLink(destination:itemMsg[index].itemView(index:index)){
                HStack{
                    Image(itemMsg[index].image).resizable()
                        .frame(width: 40,height: 40)
                        .cornerRadius(5)

                    Text(itemMsg[index].name).padding(10)
                }.padding(2)
            }
        }
    }
}

//遵循Identifiable协议
struct ItemMessage:Identifiable{
    var id=UUID()//自增 唯一
    var image:String
    var name:String
    
    //跳转到详情页面控制
    func itemView(index:Int)->AnyView{
        switch index{
        case 0:
            return AnyView(DetailsView01())
        case 1:
            return AnyView(DetailsViewMVVM())
        case 2:
            return AnyView(DetailsView03())
        case 3:
            return AnyView(DetailsView04())
        case 4:
            return AnyView(DetailsView05())
        case 5:
            return AnyView(DetailsView06())
        case 6:
            return AnyView(DetailsView07())
        default:
            return AnyView(EmptyView())
        }
    }
}



struct HomeView1_Previews: PreviewProvider {
    static var previews: some View {
        HomeView1()
    }
}
