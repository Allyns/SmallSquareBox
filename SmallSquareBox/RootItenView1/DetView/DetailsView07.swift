//
//  DetailsView07.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/11.
//

import SwiftUI

struct DetailsView07: View {
    @State var isAllowTurnLeft: Bool = true
    @State var isAllowGoStraight: Bool = true
    @State var isAllowTrunRight: Bool = true
    @State var isLeftWarning: Bool = false
    @State var isGoStraightWarning: Bool = false
    @State var isRightWarning: Bool = false

    init() {
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationView {
            VStack {
                // 红绿灯
                HStack(spacing: 20) {
                    leftLightView(isAllow: isAllowTurnLeft, isWarning: isLeftWarning)
                    goStraightLightView(isAllow: isAllowGoStraight, isWarning: isGoStraightWarning)
                    rightLightView(isAllow: isAllowTrunRight, isWarning: isRightWarning)
                }.padding()
                ruleListView()
            }
        }.navigationTitle("红绿灯")
//        .navigationBarItems(leading: backToMineView)
    }

    // 返回上一页
    private var backToMineView: some View {
        Button(action: {}) {
            Image(systemName: "arrow.backward")
                .foregroundColor(.black)
        }
    }

    // 规则列表
    func ruleListView() -> some View {
        Form {
            Section {
                Toggle(isOn: $isAllowTurnLeft) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("左转")
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                        Text(isAllowTurnLeft ?"左转通行" : "禁止左转")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
                Toggle(isOn: $isAllowGoStraight) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("直行")
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                        Text(isAllowGoStraight ? "直行通行" : "禁止直行")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
                Toggle(isOn: $isAllowTrunRight) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("右转")
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                        Text(isAllowTrunRight ? "右转通行" : "禁止右转")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
            }.padding(.vertical, 5)
        }
    }

    // 左转
    func leftLightView(isAllow: Bool, isWarning: Bool) -> some View {
        VStack(alignment: .center, spacing: 30) {
            Image(systemName: "arrow.backward")
                .font(.system(size: 32))
                .foregroundColor(isAllow ? .gray : .red)
            Image(systemName: "arrow.backward")
                .font(.system(size: 32))
                .foregroundColor(isWarning ? .yellow : .gray)
            Image(systemName: "arrow.backward")
                .font(.system(size: 32))
                .foregroundColor(isAllow ? .green : .gray)
        }
        .padding()
        .frame(height: 200)
        .background(.black)
        .cornerRadius(8)
    }

    // 直行
    func goStraightLightView(isAllow: Bool, isWarning: Bool) -> some View {
        VStack(alignment: .center, spacing: 15) {
            Image(systemName: "circle.fill")
                .font(.system(size: 32))
                .foregroundColor(isAllow ? .gray : .red)
            Image(systemName: "circle.fill")
                .font(.system(size: 32))
                .foregroundColor(isWarning ? .yellow : .gray)
            Image(systemName: "circle.fill")
                .font(.system(size: 32))
                .foregroundColor(isAllow ? .green : .gray)
        }
        .padding()
        .frame(height: 200)
        .background(.black)
        .cornerRadius(8)
    }

    // 右转
    func rightLightView(isAllow: Bool, isWarning: Bool) -> some View {
        VStack(alignment: .center, spacing: 30) {
            Image(systemName: "arrow.forward")
                .font(.system(size: 32))
                .foregroundColor(isAllow ? .gray : .red)
            Image(systemName: "arrow.forward")
                .font(.system(size: 32))
                .foregroundColor(isWarning ? .yellow : .gray)
            Image(systemName: "arrow.forward")
                .font(.system(size: 32))
                .foregroundColor(isAllow ? .green : .gray)
        }
        .padding()
        .frame(height: 200)
        .background(.black)
        .cornerRadius(8)
    }
}

struct DetailsView07_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView07()
    }
}
