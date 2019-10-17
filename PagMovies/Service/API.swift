//
//  API.swift
//  PagMovies
//
//  Created by Israel on 16/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

protocol APIService {
    func getMovies(onComplete:@escaping(Movie) -> Void, onError:@escaping(Error) -> Void)
    func getGenres(onComplete:@escaping(Genres) -> Void, onError:@escaping(Error) -> Void)
}

class API: APIService {
    
    func getMovies(onComplete:@escaping(Movie) -> Void, onError:@escaping(Error) -> Void) {
        if let url = URL(string: Endpoints.getMovies) {
            let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                
                if error == nil {
                    guard let data = data else { return }
                    if let dictJson = self?.parseDataToDictionary(data) {
                        
                        if let model = try? JSONDecoder().decode(Movie.self, from: JSONSerialization.data(withJSONObject: dictJson, options: .prettyPrinted)) {
                            onComplete(model)
                        }
                    }
                    
                }
                onError(error!)
            }
            dataTask.resume()
        }
    }
    
    func getGenres(onComplete:@escaping(Genres) -> Void, onError:@escaping(Error) -> Void) {
        if let url = URL(string: Endpoints.getGenres) {
            let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                
                if error == nil {
                    guard let self = self else { return }
                    guard let data = data else { return }
                    
                    if let dictJson = self.parseDataToDictionary(data) {
                        
                        if let model = try? JSONDecoder().decode(Genres.self, from: JSONSerialization.data(withJSONObject: dictJson, options: .prettyPrinted)) {
                            onComplete(model)
                        }
                    }
                }
                onError(error!)
            }
            dataTask.resume()
        }
    }
    
    private func parseDataToDictionary(_ data:Data) -> [String: Any]? {
        
        if let dictJson = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
            return dictJson
        }
        return nil
    }
    
}
