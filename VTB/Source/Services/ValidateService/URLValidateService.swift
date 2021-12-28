//
//  URLValidateService.swift
//  VTB
//
//  Created by admin on 28.12.2021.
//

import Foundation

protocol URLValidateServiceProtocol {
    
    func sendRequest(url: URL, completion: @escaping (Result<URLResponse, Error>) -> Void)
}

struct URLValidateService: URLValidateServiceProtocol {
    func sendRequest(url: URL, completion: @escaping (Result<URLResponse, Error>) -> Void) {
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {
            
            (_, response, error) in
            DispatchQueue.main.async {
                guard let response = response else {
                    return
                }

                completion(.success(response))
                
                if let error = error {
                    completion(.failure(error))
                    
                    return
                }
            }
        }.resume()
    }
}
