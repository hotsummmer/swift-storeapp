//
//  API.swift
//  StoreApp
//
//  Created by yuaming on 13/07/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import Foundation

enum API {
  static let shared: APIServer = DefaultAPIServer()
  case list(String)
}

extension API {
  var path: String {
    switch self {
    case let .list(id):
      return "/\(id)"
    }
  }
}

enum APIServerResult {
  case success([Codable])
  case error(Error)
}

protocol APIServer {
  func url(_ id: String) -> URL?
}

extension APIServer {
  typealias ResultClosure = (APIServerResult) -> Void
  
  func request<ResultType: Codable>(foodType: FoodType, type: [ResultType].Type, completionHandler: @escaping ResultClosure) {
    guard let url = API.shared.url(foodType.description) else { return }
      
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      if let error = error {
        completionHandler(.error(error))
      } else {
        let decodedData = JSONConverter.decode(in: data, type: type)
        completionHandler(.success(decodedData))
      }
    }.resume()
  }
}

private struct DefaultAPIServer: APIServer {
  let host: String = "http://crong.codesquad.kr:8080/woowa"
  
  func url(_ id: String) -> URL? {
    return URL(string: "\(host)\(API.list(id).path)")
  }
}
