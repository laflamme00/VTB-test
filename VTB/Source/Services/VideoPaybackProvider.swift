//
//  VideoPaybackProvider.swift
//  VTB
//
//  Created by admin on 27.12.2021.
//

import Foundation
import UIKit

protocol VideoPaybackProviderProtocol {
    
    func provideVideo(url: URL, completion: @escaping (UIImage?, URLResponse, Error) -> Void)
}

struct VideoPaybackProvider: VideoPaybackProviderProtocol {
    
    let validateService: URLValidateServiceProtocol
    let thumbnailService: GetThumbnailServiceProtocol
    
    init(validateService: URLValidateServiceProtocol,
         thumbnailService: GetThumbnailServiceProtocol) {
        self.validateService = validateService
        self.thumbnailService = thumbnailService
    }
    
    func provideVideo(url: URL, completion: @escaping (UIImage?, URLResponse, Error) -> Void) {
        validateVideoURL(url: url) { result in
            switch result {
            case .success(let response):
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
                
                let error = NSError(domain: API.host, code: httpResponse.statusCode, userInfo: nil)
                
                if httpResponse.statusCode == HttpStatusCode.ok.rawValue,
                   let thumbnail = self.thumbnailService.getThumbnail(url: url) {
                    completion(thumbnail, httpResponse, error)
                } else {
                    completion(nil, httpResponse, error)
                }
                
            case .failure(_):
                return
            }
        }
    }
    
    func validateVideoURL(url: URL, completion: @escaping (Result<URLResponse, Error>) -> Void) {
        validateService.sendRequest(url: url) { result in
            completion(result)
        }
    }
}
