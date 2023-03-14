//
//  DataModel.swift
//  NewsWall
//
//  Created by Irakli Nozadze on 14.03.23.
//

import Foundation

class DataModel {
    
    private var dataTask: URLSessionDataTask?
    
    func loadSongs(company: String, completion: @escaping(([Article]) -> Void)) {
        dataTask?.cancel()
        guard let url = buildUrl(forCompany: company) else {
            completion([])
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion([])
                return
            }
            
            if let newsResponse = try? JSONDecoder().decode(NewsResoponse.self, from: data) {
                completion(newsResponse.articles)
            }
        }
        dataTask?.resume()
    }
    
    private func buildUrl(forCompany company: String) -> URL? {
//        guard !company.isEmpty else { return nil }
        
        let queryItems = [
            URLQueryItem(name: "term", value: company),
            URLQueryItem(name: "from", value: buildDateString(forDate: Date())),
            URLQueryItem(name: "sortBy", value: "popularity"),
        ]
        var components = URLComponents(string: "https://itunes.apple.com/search")
        components?.queryItems = queryItems

        return components?.url
    }
    
    // to be implemented
    private func buildDateString(forDate: Date) -> String {
        return "2023-02-11"
    }
}


struct NewsResoponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let author: String
    let title: String
    let shortDescription: String
    let articleUrl: String
    let imageUrl: String
    let publisheDate: String
    let fullContent: String
    
    enum codingKeys: String, CodingKey {
        case source
        case author
        case title
        case shortDescription = "description"
        case articleUrl = "url"
        case imageUrl = "urlToImage"
        case publisheDate = "publishedAt"
        case fullContent = "content"
    }
}

struct Source: Decodable {
    let id: Int?
    let name: String
}
