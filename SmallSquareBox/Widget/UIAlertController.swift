//
//  UIAlertController.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import Foundation
import UIKit

extension UIAlertController {
    func show() {
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            rootViewController.present(self, animated: true)
        }
    }
}

