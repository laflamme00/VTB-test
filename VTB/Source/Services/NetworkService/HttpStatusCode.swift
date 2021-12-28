//
//  HttpStatusCode.swift
//  VTB
//
//  Created by admin on 27.12.2021.
//

import Foundation

enum HttpStatusCode: Int {
    case ok = 200
    case clientErrorsStartPoint = 400
    case notFound = 404
    case serviceUnavailable = 503
}
