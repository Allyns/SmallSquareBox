//
//  BookDetailViewModel.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//

import Foundation

class BookDetailViewModel: ObservableObject {
    @Published var fetchStatus: FetchStatus = .fetching
    
    let bookID: String
    var book: BookDetail?
    var comments: [BookComment]?
    var recommendBooks: [Book]?
    
    init(bookID: String) {
        self.bookID = bookID
        Task { await fetchData() }
    }
    
    @MainActor
    func fetchData() async {
        do {
            fetchStatus = .fetching
            
            book = try await BookDetailService.requestDetail()
            comments = try await BookDetailService.requestComments()
            recommendBooks = try await BookDetailService.requestRecommendBooks()
            
            fetchStatus = .idle
        } catch {
            fetchStatus = .failed
        }
    }
    
    func requestDetail(completion: (()->Void)? = nil) {
        guard let url = Bundle.main.url(forResource: "novel_detail", withExtension: "json"),
              let response = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: response, options: []) as? [String: Any],
              let dataMap = json["data"] as? [String: Any],
              let data = try? JSONSerialization.data(withJSONObject: dataMap, options: [])
        else {
            return
        }
        book = try? JSONDecoder().decode(BookDetail.self, from: data)
        completion?()
    }
    
    func requestComments(completion: (()->Void)? = nil) {
        guard let url = Bundle.main.url(forResource: "novel_comment", withExtension: "json"),
              let response = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: response, options: []) as? [String: Any],
              let dataMap = json["data"] as? [[String: Any]],
              let data = try? JSONSerialization.data(withJSONObject: dataMap, options: [])
        else {
            return
        }
        comments = try! JSONDecoder().decode([BookComment].self, from: data)
        completion?()
    }
    
    func requestrecommendBooks(completion: (()->Void)? = nil) {
        guard let url = Bundle.main.url(forResource: "novel_recommend", withExtension: "json"),
              let response = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: response, options: []) as? [String: Any],
              let dataMap = json["data"] as? [[String: Any]],
              let data = try? JSONSerialization.data(withJSONObject: dataMap, options: [])
        else {
            return
        }
        recommendBooks = try! JSONDecoder().decode([Book].self, from: data)
        completion?()
    }
}
