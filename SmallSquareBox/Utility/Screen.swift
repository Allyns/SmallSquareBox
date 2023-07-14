//
//  Screen.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import Foundation
import SwiftUI
import UIKit

class Screen {
    static var safeAreaInsets: UIEdgeInsets {
        UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero
    }

    static var navigationBarHeight: CGFloat {
        49.0 + safeAreaInsets.top
    }

    static var tabbarHeight: CGFloat {
        50.0 + safeAreaInsets.bottom
    }

    static func horizontalSafeAreaInsets(padding: CGFloat = 0) -> EdgeInsets {
        EdgeInsets(top: 0, leading: safeAreaInsets.left + padding, bottom: 0, trailing: safeAreaInsets.right + padding)
    }
}

let allImages:[String]=["0e25d202307062339515964","2a64f202307132218129391","5a2ea202307132131554018","6a8c0202307112341478266","18de0202307062340539571","79ea1202307112339505087","0433b202307062340456679","674d4202307120053322551","52763202307132105064046","91062202307132225181328","15693202307140004218816","b1eb9202307112347455598","bda9d202307132153278668","c3f83202307132134262206","dd572202307112353323950","f03a9202307132127589558","data_avatar2","data_avatar3","data_avatar4","data_avatar5","data_avatar6","data_avatar8","data_avatar4","data_avatar6"]
