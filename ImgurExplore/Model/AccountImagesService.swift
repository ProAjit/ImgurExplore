//
//  AccountImagesService.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation
import OSLog

final class AccountImagesService {
        
    static func getAccountImagesData() async throws -> AccountImagesModel {
        
        guard let url = URL(string: ImgurKeys.accountImages) else {
            throw UserError.invalidUrl
        }
        
        let accToken: String = "Bearer f4641795bbb009d1eadf5a95153e33a6c2299545"
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
            return try decoder.decode(AccountImagesModel.self, from: jsonData)
        } catch {
            throw UserError.invalidData
        }
    }
    
}
