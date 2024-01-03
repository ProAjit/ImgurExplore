//
//  ImgurImagesDataHttpService.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation

protocol ImgurImagesDataHttpService {
    func getData() async -> AccountImagesModel?
}
