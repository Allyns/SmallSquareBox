//
//  DetailsView03.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/11.
//

import SwiftUI

struct DetailsView03: View {
    @State var totalCountdown: CGFloat = 30
    @State var counter: Int = 10
    @State var isStart = false
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                progressTrackView()
                progressBarView()
                progressTimeView()
            }
            Spacer()
            btnView()
        }.onReceive(timer) { _ in
            self.startCounting()
        }
    }

    // 开始计时
    func startCounting() {
        if isStart {
            if counter < Int(totalCountdown) {
                counter += 1
            } else {
                isStart.toggle()
            }
        }
    }

    // 操作按钮
    func btnView() -> some View {
        HStack(spacing: 55) {
            // 开始按钮
            Image(systemName: self.isStart ? "pause.fill" : "play.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: 80, minHeight: 0, maxHeight: 80)
                .background(self.isStart ? .red : .green)
                .clipShape(Capsule())
                .onTapGesture {
                    self.isStart.toggle()
                }

            // 重置按钮
            Image(systemName: "arrow.clockwise")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: 80, minHeight: 0, maxHeight: 80)
                .background(.blue)
                .clipShape(Capsule())
                .onTapGesture {
                    self.counter = 0
                    withAnimation(.default) {
                        self.totalCountdown = 30
                    }
                }
        }.padding(.bottom, 55)
    }

    // 进度时间
    func progressTimeView() -> some View {
        Text(counterToMinutes())
            .font(.system(size: 48))
            .fontWeight(.black)
    }

    // 获得格式化时间
    func counterToMinutes() -> String {
        let currentTime = Int(totalCountdown) - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }

    // 进度圆环
    func progressBarView() -> some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle()
                    .trim(from: 0, to: startProgress())
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.init(degrees: -90))
                    .foregroundColor(
                        withAnimation(.easeInOut(duration: 0.2)) {
                            completed() ? Color.green : Color.orange
                        }
                    )
            )
    }

    // 获得结束进度
    func completed() -> Bool {
        return startProgress() == 1
    }

    // 获得开始进度
    func startProgress() -> CGFloat {
        return CGFloat(counter) / CGFloat(totalCountdown)
    }

    // 背景圆环
    func progressTrackView() -> some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(Circle().stroke(Color.black.opacity(0.09), lineWidth: 15))
    }
}

struct DetailsView03_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView03()
    }
}
