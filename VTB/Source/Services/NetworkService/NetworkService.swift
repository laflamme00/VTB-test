//
//  NetworkService.swift
//  VTB
//
//  Created by admin on 27.12.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func sendRequest<T: Decodable>(completion: @escaping (Result<T?, Error>) -> Void)
}

final class NetworkService: NSObject, NetworkServiceProtocol {
    
    func sendRequest<T>(completion: @escaping (Result<T?, Error>) -> Void) where T : Decodable {
        guard let url = createUrl() else {
            return
        }
        
        let request = URLRequest(url: url)
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration,
                             delegate: self,
                             delegateQueue: nil)
        
        session.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                if let httpResponse = response as? HTTPURLResponse,
                   httpResponse.statusCode >= HttpStatusCode.clientErrorsStartPoint.rawValue {
                    
                    let error = NSError(domain: API.host, code: httpResponse.statusCode, userInfo: nil)
                    completion(.failure(error))
                    
                    return
                }
                
                if let error = error {
                    completion(.failure(error))
                    
                    return
                }
                
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase

                        let data = try decoder.decode(T.self, from: data)
                        completion(.success(data))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    private func createUrl() -> URL? {
        var components = URLComponents()
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.path
        
        return components.url
    }
}

extension NetworkService: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        if challenge.protectionSpace.serverTrust != nil {
            guard let serverTrust = challenge.protectionSpace.serverTrust else {
                return
            }
            
            completionHandler(.useCredential, URLCredential(trust: serverTrust))
        } else {
            completionHandler(.useCredential, nil)
        }
    }
}
