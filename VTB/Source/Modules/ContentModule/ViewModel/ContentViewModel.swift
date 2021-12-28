//
//  PlayerViewModel.swift
//  VTB
//
//  Created by admin on 27.12.2021.
//

import Foundation

protocol ContentBusinessLogic {
    
    func getVideo()
    func playVideo()
}

final class ContentViewModel: ContentBusinessLogic {
    private enum Constants {
        static let error404title = "Not Found"
        static let error503title = "Service Unavailable"
        static let error404description = "The resourse requested could not be found on this server!"
        static let error503description = "The server is temporarily unable to service your request due to maintenance downtime or capacity problem. Please, try again later."
    }
    
    // TODO: - +VideoDataSourceProvider (func getVideo)
    
    weak var viewController: ContentDisplayLogic?
    private var videoProvider: VideoPaybackProviderProtocol
    
    var videoUrl: URL?
    
    private var contentVCs = [ContentViewController]()
    
    init(videoProvider: VideoPaybackProviderProtocol = VideoPaybackProvider(validateService: URLValidateService(),
                                                                            thumbnailService: GetThumbnailService())) {
        self.videoProvider = videoProvider
    }
    
    func getVideo() {
        
        viewController?.state = .processingURL
        
        guard let url = videoUrl else {
            return
        }
        
        videoProvider.provideVideo(url: url) { [weak self] (thumbnail, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            
            if httpResponse.statusCode == HttpStatusCode.ok.rawValue,
                let thumbnail = thumbnail {
                self?.viewController?.state = .readyForPlay(thumbnail)
            } else if httpResponse.statusCode == HttpStatusCode.notFound.rawValue {
                self?.viewController?.state = .errorURL(ErrorModel(statusCode: String(httpResponse.statusCode),
                                                                   title: Constants.error404title,
                                                                   description: Constants.error404description))
            } else if httpResponse.statusCode == HttpStatusCode.serviceUnavailable.rawValue {
                self?.viewController?.state = .errorURL(ErrorModel(statusCode: String(httpResponse.statusCode),
                                                                   title: Constants.error503title,
                                                                   description: Constants.error503description))
            }
        }
    }
    
    func playVideo() {
        guard let url = videoUrl else {
            return
        }
        
        self.viewController?.playVideo(url: url)
    }
}
