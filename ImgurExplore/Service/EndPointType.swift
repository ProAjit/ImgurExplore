//
//  EndPointType.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

public protocol EndPointType {

    var baseURL: URL? { get }

    var path: String { get }

    var method: HttpMethod { get }

    var headers: [String: String]? { get }
    
    func buildUrlRequest() -> URLRequest?
}

extension EndPointType {
    
    func buildUrlRequest() -> URLRequest? {
        
        guard let baseUrl = self.baseURL,
        let urlWithPath = baseUrl.appendingPathComponent(self.path).absoluteString.removingPercentEncoding,
        let completeUrl = URL(string: urlWithPath) else { return nil }
        var urlRequest = URLRequest(url: completeUrl)
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.allHTTPHeaderFields = self.headers
        return urlRequest
    }
}
