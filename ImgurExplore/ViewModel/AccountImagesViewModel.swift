//
//  AccountImagesViewModel.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation

protocol AccountImagesProtocol: AnyObject {
    func returnData(accountImagesData : AccountImagesModel?)
    func returnError(error : UserError?)
    func getAccountImages()
}

final class AccountImagesViewModel {
    
    private(set) var userError: UserError?
    var accountImagesModel : AccountImagesModel?
    weak var delegate : AccountImagesProtocol!
    
    func callImgurAccountImagesAPI() {
        Task {
            do {
                accountImagesModel = try await AccountImagesService.getAccountImagesData()
                self.delegate?.returnData(accountImagesData: accountImagesModel)
            } catch (let error) {
                let userError = UserError.custom(error: error)
                self.delegate.returnError(error: userError)
            }
        }
    }
    
}
