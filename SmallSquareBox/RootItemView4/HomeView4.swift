//
//  HomeView4.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/10.
//

import SwiftUI

struct HomeView4: View {
    init() {
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255).edgesIgnoringSafeArea(.all)

                Form {
                    Section {
                        mineMessageView
                    }
                    Section {
                        listItemView(itemImage: "lock", itemName: "账号绑定", itemContent: "已绑定")
                        listItemView(itemImage: "gear.circle", itemName: "通用设置", itemContent: "")
                        listItemView(itemImage: "briefcase", itemName: "简历管理", itemContent: "未上传")
                        listItemView(itemImage: "icloud.and.arrow.down", itemName: "版本更新", itemContent: "Version 6.2.8")
                        listItemView(itemImage: "leaf", itemName: "清理缓存", itemContent: "0.00MB")
                        listItemView(itemImage: "person", itemName: "关于掘金", itemContent: "")
                    }
                    Section {
                        signOutView
                    }
                }
            }
            .navigationBarTitle("设置", displayMode: .inline)
    
        }
    }

    // MARK: 栏目结构

    struct listItemView: View {
        var itemImage: String
        var itemName: String
        var itemContent: String
        var body: some View {
            Button(action: {}) {
                HStack {
                    Image(systemName: itemImage)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    Text(itemName)
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                    Spacer()
                    Text(itemContent)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }.padding(.vertical, 10)
            }
        }
    }

    // 个人信息
    private var mineMessageView: some View {
        Button(action: {}) {
            HStack(spacing: 15) {
                Image("data_avatar10")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(.systemGray5), lineWidth: 1))

                VStack(alignment: .leading, spacing: 5) {
                    Text("Allyn")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                    Text("前端开发")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 10)
        }
    }

    // 退出登录
    private var signOutView: some View {
        Button(action: {}) {
            Text("退出登录")
                .font(.system(size: 16))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 29, maxHeight: 29)
                .foregroundColor(.red)
                .cornerRadius(8)
                .padding(.vertical, 4)
        }
    }

}

struct HomeView4_Previews: PreviewProvider {
    static var previews: some View {
        HomeView4()
    }
}
