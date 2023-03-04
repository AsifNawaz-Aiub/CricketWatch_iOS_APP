//
//  NetworkManager.swift
//  CricketWatch
//
//  Created by BJIT on 10/2/23.
//

import Foundation

class NetworkManager{
    
    static let shared = NetworkManager()
    private let baseURL = "https://cricket.sportmonks.com"
    var urlComponents = URLComponents()
    let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    var cache : URLCache{
        get{
            URLCache(memoryCapacity: 100 * 1024 * 1024, diskCapacity: 100 * 1024 * 1024, directory: cacheDirectory)
        }
    }
    
    private init() {
        
    }
    func setUrlCompo(endpoint: String, parameters: [String: String]) -> URL?{
        urlComponents.scheme = "https"
        urlComponents.host = "cricket.sportmonks.com"
        urlComponents.path = endpoint
        var queryItems = [URLQueryItem]()
        for (key, value) in parameters {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponents.queryItems = queryItems
        //print(urlComponents.url?.absoluteURL)
        return urlComponents.url
    }
    func fetchData(with endpoint: String, parameters: [String: String], completion: @escaping (Result<Data, CustomError>) -> Void) {
        //cache.removeAllCachedResponses()
        guard let url = setUrlCompo(endpoint: endpoint, parameters: parameters) else { return }
        var request = URLRequest(url: url)
        request.cachePolicy = .returnCacheDataElseLoad
        print(url)
        let session = URLSession.shared
        session.configuration.urlCache = cache
        session.configuration.requestCachePolicy = .returnCacheDataElseLoad
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
              completion(.failure(.unableToComplete))
            return
          }
          guard let data = data else { return }
          completion(.success(data))
        }
        task.resume()
      }

}

