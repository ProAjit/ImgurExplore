//
//  ImgurImagesDataHttpServiceImpl.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation

class ImgurImagesDataHttpServiceImpl: ImgurImagesDataHttpService {
    
    private var service: HttpService?
    
    init(httpService: HttpService) {
        self.service = httpService
    }
    
    func getData() async -> AccountImagesModel? {
        let endpoint: ImgurAPIEndPoint = .getListOfImages
        guard let urlRequest = endpoint.buildUrlRequest(), let result = await self.service?.getData(request: urlRequest),
                case .success(let data) = result else {
            return nil
        }
        let parsedData = JsonDataParser<AccountImagesModel>.parseData(data: data)
        return parsedData
    }
}
