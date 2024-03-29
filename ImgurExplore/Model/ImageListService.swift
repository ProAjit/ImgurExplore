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
        
        guard let url = URL(string: ImgurKeys.accountImages) else {
            throw UserError.invalidUrl
        }
        let accToken: String = "Bearer" + ImgurKeys.access_Token
        var request = URLRequest(url: url)
        request.httpMethod = APIMethod.get
        request.addValue(accToken, forHTTPHeaderField: "Authorization")
        
        let (jsonData, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(ImageListModel.self, from: jsonData)
        } catch {
            throw UserError.invalidData
        }
    }
    
}
