//
//  ContentViewState.swift
//  VTB
//
//  Created by admin on 27.12.2021.
//

import Foundation
import UIKit

enum ContentViewState {
    case preparingForVideo
    case processingURL
    case readyForPlay(UIImage)
    case errorURL(ErrorModel)
}
