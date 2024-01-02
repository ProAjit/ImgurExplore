//
//  ImageListService.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 02/01/24.
//

import Foundation
import OSLog

final class ImageListService {
        
    static func getImageListModelData() async throws -> ImageListModel {
        
        guard let url = URL(string: ImgurKeys.searchURL) else {
            throw UserError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = APIMethod.get
        request.addValue(ImgurKeys.client_id, forHTTPHeaderField: "Authorization")
        
        let (jsonData, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            let decodeAndPrint = { 
                print(try! decoder.decode(ImageListModel.self, from: jsonData))
            }
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decodeAndPrint()
            return try decoder.decode(ImageListModel.self, from: jsonData)
        } catch {
            throw UserError.invalidData
        }
    }
    
}


enum UserError : LocalizedError {
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
