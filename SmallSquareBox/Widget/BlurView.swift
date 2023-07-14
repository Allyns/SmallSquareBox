//
//  BlurView.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import Foundation
import SwiftUI

struct BlurView: UIViewRepresentable {
    let blurEffect: UIBlurEffect
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }
    
    func updateUIView(_ nsView: UIVisualEffectView, context: Context) {}
}

