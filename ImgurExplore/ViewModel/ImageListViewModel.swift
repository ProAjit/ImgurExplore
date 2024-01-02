//
//  ImageListViewModel.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 02/01/24.
//

import Foundation

protocol ImageListProtocol: AnyObject {
    func returnData(imgurImageListData : ImageListModel?)
    func returnError(error : UserError?)
    func callImgurImageListAPI() 
}

final class ImageListViewModel {
    
    var imgurImageListData : ImageListModel?
    private(set) var userError: UserError?
    weak var delegate : ImageListProtocol!
    
    func callImgurImageListAPI() {
        Task {
            do {
                imgurImageListData = try await ImageListService.getImageListModelData()
                self.delegate?.returnData(imgurImageListData: imgurImageListData)
            } catch (let error) {
                let userError = UserError.custom(error: error)
                self.delegate.returnError(error: userError)
            }
        }
    }
    
}
