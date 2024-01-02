//
//  Looger.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 02/01/24.
//

import Foundation
import OSLog

extension Logger {
    private static let appIdentifier = Bundle.main.bundleIdentifier ?? ""
    static let main = Logger(subsystem: appIdentifier, category: "main")
    static let imageList = Logger(subsystem: appIdentifier, category: "image")
}
