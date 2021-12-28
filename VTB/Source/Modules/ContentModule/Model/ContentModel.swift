//
//  ContentModel.swift
//  VTB
//
//  Created by admin on 25.12.2021.
//

import Foundation

struct ContentModel: Decodable {
    let results: VideoUrlDataSource
}

struct VideoUrlDataSource: Decodable {
    let single: String
    let splitV: String
    let splitH: String
    let src: String
}
