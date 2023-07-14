//
//  BookstoreService.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import Foundation

class BookstoreService {
    typealias ListResult = (carousels: [Carousel]?, menus: [MenuRead]?, cards: [BookCard])
    
    static func requestList(type: BookstoreListType) async throws -> ListResult {
        // The delay is to simulate a network request
        try await Task.sleep(nanoseconds: 500 * 1_000_000)
        
        return try await withCheckedThrowingContinuation { continuation in
            
            let session = URLSession(configuration: .default)
            session.dataTask(with: URL(string: type.rawValue)!) { data, _, _ in
                guard let jsonData = data else { return }
                let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
                let data = json!["data"] as? [String: Any]
                let modules = data!["module"] as? [[String: Any]]
                
                var carousels: [Carousel]?
                var menus: [MenuRead]?
                var cards: [BookCard] = []
                   
                for module in modules! {
                    let moduleName = module["m_s_name"] as? String
                    let content = module["content"] as? [Any] ?? []
                    guard let data = try? JSONSerialization.data(withJSONObject: content, options: []) else {
                        continue
                    }
                    switch moduleName {
                    case "top_banner":
                        carousels = try? JSONDecoder().decode([Carousel].self, from: data)
                    case "menu":
                        menus = try? JSONDecoder().decode([MenuRead].self, from: data)
                    default:
                        if module["m_s_style"] != nil,
                           let data = try? JSONSerialization.data(withJSONObject: module, options: []),
                           let card = try? JSONDecoder().decode(BookCard.self, from: data)
                        {
                            cards.append(card)
                        }
                    }
                }
                   
                continuation.resume(with: Result.success((carousels, menus, cards)))
            }
            .resume()
        }
    }
}
