//
//  DetailsView04.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/11.
//

import SwiftUI

struct DetailsView04: View {
    @State var sentenceText: String = "不是有錢，一定会好，心好行好，命会更好。"

    private var models = [
        "人生路上，虽有精彩，但更多的，还是平淡",
        "舍得舍得，有舍就有得；得失得失，有得就有失。",
        "市场练兵，心里有底，团结拼搏，勇争第一。",
        "钱，能让生活安稳，却不是最重要的。",
        "远了怕生，近了怕烦，少了怕淡，多了怕缠。",
        "有些路必须一个人走，不是孤独，而是别无选择。",
        "无痛不快，无苦何甜，活着，本就是一种修行。",
        "哪里没有相互间的和睦，哪里就没有生活的富裕。"
    ]

    var body: some View {
        ZStack {
            Color(red: 100 / 255, green: 12 / 255, blue: 50 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                titleView()
                Spacer()
                sentenceView()
                Spacer()
                refreshBtn()
            }.padding()
        }
    }

    // 刷新按钮
    func refreshBtn() -> some View {
        Image(systemName: "repeat.circle.fill")
            .font(.system(size: 32))
            .foregroundColor(.white)
            .padding()
            .onTapGesture {
                getRandomSentence()
            }
    }

    // 随机展示句子
    func getRandomSentence() {
        let index = Int(arc4random() % UInt32(models.count))
        sentenceText = models[index]
    }


    // 句子展示
    func sentenceView() -> some View {
        Text(sentenceText)
            .padding()
            .font(.system(size: 20))
            .foregroundColor(Color(.systemGray))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 280)
            .background(.white)
            .cornerRadius(8)
    }

    // 标题
    func titleView() -> some View {
        HStack {
            Text("每日一句")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
    }
}

struct DetailsView04_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView04()
    }
}
