//
//  EmplayeeNetworkingServices.swift
//  AvitoList
//
//  Created by Saparbek . on 10.09.2021.
//

import Foundation
class AvitoNetworkingService{
    var url: URL
    
    init(url: URL){
        self.url = url
    }
    
    func fetch(completion: @escaping (Result<AvitoResponse, NetworkingError>)->()){
        let session = URLSession(configuration: .default)
        
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else {
                return
            }
            
            DispatchQueue.main.async {
                self.handleResult(data: data,
                                  response: response,
                                  error: error,
                                  completion: completion)
            }
        }.resume()
    }
    
    private func handleResult(data: Data?, response: URLResponse?, error: Error?,
                      completion: @escaping (Result<AvitoResponse, NetworkingError>)->()){
        if let error = error {
            completion(.failure(.failedToFetchData(error)))
            return
        }
        
        guard let data = data else {
            completion(.failure(.dataIsUnexpextedlyNil))
            return
        }
        
        let result = self.parseData(data: data)
        
        completion(result)
    }
    
    private func parseData(data: Data) -> Result<AvitoResponse, NetworkingError> {
        do{
            let response =  try JSONDecoder().decode(AvitoResponse.self, from: data)
            return .success(response)
        } catch {
            return .failure(.failedToParseData(data, error))
        }
    }
}
