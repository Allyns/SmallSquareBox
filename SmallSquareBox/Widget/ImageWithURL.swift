//
//  ImageWithURL.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/15.
//

import Foundation
import SwiftUI

struct ImageWithURL: View {
    @ObservedObject var imageLoader: ImageLoaderAndCache
 
    init(_ url: String) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
        print("链接:"+url)
    }

    var body: some View {
//        Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
        
        Image(allImages[Int(arc4random()) % 24]).resizable().clipped().frame(width: 170,height: 170)
    }
}

class ImageLoaderAndCache: ObservableObject {
    @Published var imageData = Data()

    init(imageURL: String) {
        let cache = URLCache.shared
        let request = URLRequest(url: URL(string: imageURL)!, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, _ in
            if let data = data{
                DispatchQueue.main.async {
                    print("downloaded from internet")
                    self.imageData = data
                }
            }
        }).resume()
    }
}
