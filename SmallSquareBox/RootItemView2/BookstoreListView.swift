//
//  BookstoreListView.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//


import SwiftUI

struct BookstoreListView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @ObservedObject var viewModel: BookstoreListViewModel
    
    var content: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack(alignment: .leading) {
                    if let carousels = viewModel.carousels, horizontalSizeClass == .compact  {
                            TabView {
                                ForEach(carousels, id: \.imageUrl) { carousel in
                                    Image(allImages[Int(arc4random()) % 24]).resizable()
                                }
                            }.tabViewStyle(PageTabViewStyle()).aspectRatio(Drawing.carouselAspect, contentMode: .fill)

                    }
                    if let menus = viewModel.menus {
                        BookstoreMenuView(menus: menus)
                    }
                    Spacer(minLength: Drawing.sectionHeight)
                    
                    ForEach(viewModel.cards, id: \.title) { card in
                        SectionHeader(title: card.title)
                        switch card.style {
                        case .grid:
                            BookGridView(books: card.books)
                        case .hybird:
                            BookHybirdView(books: card.books)
                        case .cell:
                            BookHorizontalView(books: card.books)
                        case .unknow:
                            BookGridView(books: card.books)
                        }
                        Spacer(minLength: Drawing.sectionHeight)
                    }.foregroundColor(ThemeColor.darkGray)
                }
                .padding(EdgeInsets(top: Screen.navigationBarHeight, leading: Screen.safeAreaInsets.left, bottom: Drawing.tabBarHeight + Screen.safeAreaInsets.bottom, trailing: Screen.safeAreaInsets.right))
            }.background(ThemeColor.card)
        }
    }
    
    var body: some View {
        Group {
            if viewModel.fetchStatus == .fetching {
                ProgressView()
            } else {
                content
            }
        }.onAppear {
            if viewModel.cards.isEmpty {
                Task { await viewModel.fetchData() }
            }
        }
    }
    
    private struct Drawing {
        static let carouselAspect: CGFloat = 5/3
        static let tabBarHeight = 50.0
        static let sectionHeight = 20.0
    }
}
