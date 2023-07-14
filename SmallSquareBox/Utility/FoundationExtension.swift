//
//  FoundationExtension.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//


import Foundation
import SwiftUI

extension Double {
    public func toStringAsFixed(_ fractionDigits: Int) -> String {
        let format = String(format: "%%0.%df", fractionDigits)
        return String(format: format, self)
    }
}

