//
//  GetThumbnailService.swift
//  VTB
//
//  Created by admin on 28.12.2021.
//

import Foundation
import UIKit
import AVKit

protocol GetThumbnailServiceProtocol {
    func getThumbnail(url: URL) -> UIImage?
}

struct GetThumbnailService: GetThumbnailServiceProtocol {
    func getThumbnail(url: URL) -> UIImage? {
        do {
            let asset = AVURLAsset(url: url, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            
            imgGenerator.appliesPreferredTrackTransform = true
            
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            
            return thumbnail
            
        } catch {
            return nil
        }
    }
}

