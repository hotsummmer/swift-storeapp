//
//  LocalFileManager.swift
//  StoreApp
//
//  Created by oingbong on 18/12/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

struct LocalFileManager {
    static func filePath(fileName: String) -> URL {
        let filePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        let destinaionURL = filePath[0].appendingPathComponent(fileName)
        return destinaionURL
    }
}