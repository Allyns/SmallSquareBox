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
                .onAppear(perform: setupAppearance)
        }
    }
    
    func setupAppearance() {
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
    }

}
