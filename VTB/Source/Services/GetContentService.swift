//
//  GetVideoService.swift
//  VTB
//
//  Created by admin on 27.12.2021.
//

import Foundation

protocol GetContentServiceProtocol {
    typealias ResultContent = (Result<ContentModel?, Error>) -> Void
    
    func getContent(completion: @escaping ResultContent)
}

struct GetContentService: GetContentServiceProtocol {
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getContent(completion: @escaping ResultContent) {
        networkService.sendRequest { (result: Result<ContentModel?, Error>) in
            completion(result)
        }

    }
}
