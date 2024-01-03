//
//  HttpService.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation

// MARK: - Error helper

enum HTTPServiceError : LocalizedError {
    case invalidUrl
    case invalidData
    case invalidResponse
    case custom(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "Invalid Url"
        case .invalidData:
            return "Invalid Data"
        case .invalidResponse:
            return "Invalid Response"
        case .custom(let error):
            return error.localizedDescription
        }
    }

}


protocol HttpService {
    
    func getData(request: URLRequest) async  -> Result<Data, HTTPServiceError>
    /*
    func postData(request: URLRequest) async throws -> Bool
    */
}
