//
//  ImageListModel.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 02/01/24.
//

import Foundation

// MARK: - ImageListModel

struct ImageListModel: Codable {
    let data: [ImageListData]
    let success: Bool
    let status: Int
}

// MARK: - ImageListData

struct ImageListData: Codable {
    let id, title: String
    let description: String?
    let datetime: Int
    let privacy : String?
    let layout: String?
    let views: Int
    let link: String
    let ups, downs, points, score: Int
    let vote: JSONNull?
    let favorite, nsfw: Bool
    let section: String
    let topic, topicID: JSONNull?
    let tags: [JSONAny]
    let images: [Image]?

    enum CodingKeys: String, CodingKey {
        case id, title, description, datetime
        case privacy, layout, views, link, ups, downs, points, score
        case vote, favorite, nsfw, section
        case topic
        case topicID = "topic_id"
        case tags
        case images
    }
}

// MARK: - Image

struct Image: Codable {
    let id: String
    let title: JSONNull?
    let datetime: Int
    let type: String
    let animated: Bool
    let width, height, size, views: Int
    let bandwidth: Int
    let vote: JSONNull?
    let favorite: Bool
    let nsfw, section, accountURL, accountID: JSONNull?
    let tags: [JSONAny]
    let edited: String
    let link: String
    let commentCount, ups, downs: JSONNull?
    let points, score: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, title, datetime, type, animated, width, height, size, views, bandwidth, vote, favorite, nsfw, section
        case accountURL = "account_url"
        case accountID = "account_id"
        case tags
        case edited
        case link
        case commentCount = "comment_count"
        case ups, downs, points, score
    }
}

