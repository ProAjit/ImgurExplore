//
//  Dependencies.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation

struct Dependencies {
    static let httpService: HttpService = HttpServiceImpl()
    static let imgurImagesDataHttpService: ImgurImagesDataHttpService = ImgurImagesDataHttpServiceImpl(httpService: httpService)
    static let accountImageViewModel = AccountImagesViewModel(service: imgurImagesDataHttpService)
}
