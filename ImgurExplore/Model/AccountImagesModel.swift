//
//  AccountImagesModel.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation

// MARK: - AccountImagesModel

struct AccountImagesModel: Codable {
    let data: [AccountImagesData]
    let success: Bool
    let status: Int
}

// MARK: - AccountImagesData

struct AccountImagesData: Codable {
    let id: String
    let title, description: String?
    let datetime: Int
    let type: TypeEnum
    let animated: Bool
    let width, height, size, views: Int
    let bandwidth: Int
    let favorite: Bool
    let edited: String
    let deletehash, name: String
    let link: String
}

enum TypeEnum: String, Codable {
    case imagePNG = "image/png"
}
