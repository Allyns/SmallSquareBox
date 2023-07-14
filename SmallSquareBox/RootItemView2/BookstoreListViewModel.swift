//
//  BookstoreListViewModel.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import Foundation

enum FetchStatus {
    case idle
    case fetching
    case failed
}

class BookstoreViewModel: ObservableObject {
    @Published var pageIndex = 0
    
    let list: [BookstoreListViewModel];
    
    init() {
        let tabTypes: [BookstoreListType] = [.excellent, .female, .male, .cartoon]
        list = tabTypes.map({ type in BookstoreListViewModel(type: type) })
    }
}

class BookstoreListViewModel: ObservableObject {
    let type: BookstoreListType
    
    @Published var fetchStatus: FetchStatus = .idle
    var menus: [MenuRead]?
    var cards: [BookCard] = []
    var carousels: [Carousel]?
    
    init(type: BookstoreListType) {
        self.type = type
    }
    
    @MainActor
    func fetchData() async {

        if fetchStatus == .fetching {
            return
        }
        do {
            fetchStatus = .fetching
     
            let result = try await BookstoreService.requestList(type: type)
            carousels = result.carousels
            menus = result.menus
            cards = result.cards
       
            fetchStatus = .idle
        } catch {
            fetchStatus = .failed
        }
    }
    
}

