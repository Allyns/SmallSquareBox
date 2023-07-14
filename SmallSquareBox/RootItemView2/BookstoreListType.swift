//
//  BookstoreListType.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//


import Foundation

enum BookstoreListType: String {
    case excellent = "https://api.npoint.io/c78d547f8e814a953010"
    case male = "https://api.npoint.io/c6111dc48169571ea649"
    case female = "https://api.npoint.io/608fabd06bddb3972948"
    case cartoon = "https://api.npoint.io/509612775140e9094c30"
    
    func title() -> String {
        switch self {
        case .excellent:
            return "汽车"
        case .male:
            return "萌宠"
        case .female:
            return "新闻"
        case .cartoon:
            return "生活"
        }
    }
}

struct MenuRead: Codable {
    let title: String
    let imageName: String
    
    enum CodingKeys: String, CodingKey {
        case title = "toTitle"
        case imageName = "icon"
    }
}

enum BookCardStyle: Int, Codable {
    case unknow
    case grid
    case hybird
    case cell
}

struct BookCard: Codable {
    let title: String
    let style: BookCardStyle
    let books: [Book]
    
    enum CodingKeys: String, CodingKey {
        case title = "m_s_name"
        case style = "m_s_style"
        case books = "content"
    }
}

struct Carousel: Codable {
    let imageUrl: String
    let linkUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case linkUrl = "link_url"
    }
}

extension Int {
    public var countDescription: String {
        self > 10000 ? String(format: "%.2f万", Double(self) / 10000.0) : "\(self)"
    }
}

