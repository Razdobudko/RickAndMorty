//
//  NetworkManager.swift
//  RickAndMorty_test
//
//  Created by Veranika Razdabudzka on 15.04.22.
//

import UIKit

class NetworkManager {
    
    static var shared = NetworkManager()
    
    func parseJSON(completion: @escaping (Model) -> Void) {
        
        let urlString = "https://rickandmortyapi.com/api/character"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let character = try JSONDecoder().decode(Model.self, from: data)
                DispatchQueue.main.async {
                    completion(character)}
            } catch{
                print(error)
            }
        }.resume()
    }
}

extension UIImageView {
    func downloaded(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url)
    }
}

