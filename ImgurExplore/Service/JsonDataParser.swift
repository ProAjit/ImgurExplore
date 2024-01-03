//
//  JsonDataParser.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation

class JsonDataParser<T: Codable> {
    class func parseData(data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            let parsedData = try decoder.decode(T.self, from: data)
            return parsedData
        } catch  {
            print("Decoding Error \(error)")
        }
        //guard let parsedData = try? decoder.decode(T.self, from: data) else { return nil }
        //return parsedData
        return nil
    }
}
