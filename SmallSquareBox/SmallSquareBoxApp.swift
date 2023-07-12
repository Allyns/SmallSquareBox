//
//  SmallSquareBoxApp.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/10.
//

import SwiftUI

@main
struct SmallSquareBoxApp: App {
    
    @StateObject var viewModel:NoteViewModel=NoteViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(viewModel)
        }
    }
}
