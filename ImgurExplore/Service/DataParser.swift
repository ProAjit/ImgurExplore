//
//  DataParser.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation

protocol DataParser {
    associatedtype T: Codable
    func parseData(data:Data) -> T
}
