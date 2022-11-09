//
//  NetworkManager.swift
//  IntroNetworking
//
//  Created by Consultant on 11/7/22.
//

import Foundation

class NetworkManager {
     var tempID : String?

    func fetchImageData(path: String, completion: @escaping (Data?) -> Void)  {
        guard let url = URL(string: path) else{
            completion(nil)
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let httpResponse = response as? HTTPURLResponse
                self.tempID = httpResponse?.value(forHTTPHeaderField: "picsum-id") ?? "0"
            if let _ = error {
                completion(nil)
                return
            }
            
            completion(data)
            
        }
        task.resume()
//        return self.tempID!
    }
    
}
//let httpResponse = response as? HTTPURLResponse
//self.tempID = httpResponse?.value(forHTTPHeaderField: "picsum-id") ?? "0"
