//
//  ImageLoader.swift
//  NewsWall
//
//  Created by Irakli Nozadze on 15.03.23.
//

import Foundation
import SwiftUI

class ImageLoader {
    private var dataTasks: [URLSessionDataTask] = []
  
    func loadImage(forArticle article: Article, completion: @escaping((Image?) -> Void)) {
        guard let imageUrl = URL(string: article.imageUrl) else {
            completion(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
            guard let data = data, let uiImage = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            let image = Image(uiImage: uiImage)
            completion(image)
        }
        dataTasks.append(dataTask)
        dataTask.resume()
    }

    func reset() {
        dataTasks.forEach { $0.cancel() }
        dataTasks.removeAll()
    }
}
