//
//  APIService.swift
//  Task
//
//  Created by vinumurugan E on 23/02/22.
//

import Foundation
import UIKit

class APIService: NSObject {
    
    static let shared = APIService()
        
    func getResponse(page:Int ,per_page:Int,completionHandler: @escaping(GitHub) -> Void) {
                
        URLSession.shared.dataTask(with: URL(string: "https://api.github.com/search/repositories?q=tetris&sort=stars&order=desc&page=\(page)&per_page=\(per_page)")!)  { (data, response, error) in
            
            if let data = data {
                DispatchQueue.main.async {
                    let jsonDecoder = JSONDecoder()
                    let dataObj = try! jsonDecoder.decode(GitHub.self, from: data)
                    completionHandler(dataObj)
                }
            }
        }.resume()
    }
}
