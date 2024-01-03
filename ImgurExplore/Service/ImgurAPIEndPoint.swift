//
//  ImgurAPIEndPoint.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation

enum ImgurAPIEndPoint {
    case getListOfImages
}

extension ImgurAPIEndPoint: EndPointType {
    
    var baseURL: URL? {
        let url = URL(string: AppConstants.accountImages)
        return url!
    }
    
    var path: String {
        switch  self {
        case .getListOfImages:
            return "/images"
        }
    }
    
    var method: HttpMethod {
        switch  self {
        case .getListOfImages:
            return .get
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json", "Authorization": AppConstants.accessToken]
    }
}
