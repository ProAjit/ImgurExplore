//
//  HttpServiceImpl.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation

class HttpServiceImpl: HttpService {
    
    func getData(request: URLRequest) async -> Result<Data, HTTPServiceError> {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                return Result.success(data)
            }
            return Result.failure(HTTPServiceError.invalidResponse)
        }
        catch {
            return Result.failure(HTTPServiceError.invalidResponse)
        }
    }
    
}
