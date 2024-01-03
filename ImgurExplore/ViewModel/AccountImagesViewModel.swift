//
//  AccountImagesViewModel.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation


final class AccountImagesViewModel {
    
    private var service: ImgurImagesDataHttpService
    private(set) var accountImagesModel : AccountImagesModel?
    
    init(service: ImgurImagesDataHttpService) {
        self.service = service
    }
    
    func getImgurAccountImagesData() async -> AccountImagesModel? {
        self.accountImagesModel = await self.service.getData()
        return self.accountImagesModel
    }
    
    func getImagesCount() -> Int {
        return self.accountImagesModel?.data.count ?? 0
    }
    
    func getImages() -> [AccountImagesData] {
        return self.accountImagesModel?.data ?? []
    }
    
}
