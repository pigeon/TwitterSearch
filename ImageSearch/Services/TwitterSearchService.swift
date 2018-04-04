//
//  TwitterSearchService.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 01/04/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import Foundation



protocol TwitterSearchService {
    func findImages(with hashtag:String, completion: @escaping SearchCompletion)
}


class TwitterSearchServiceImpl : TwitterSearchService {
    
    private let session = URLSession(configuration: URLSessionConfiguration.default)
    internal var accessToken = ""
    internal let basicAuthhorisationToken:String
    
    
    init(key:String = "AaGvDUHTeohv1VEfsQ4ClpRzG",secret:String="hDtegDJ1q6BwBSr8bgIVKAjnn6z1ihkp23DEdlRs4Js0qfJEwD") {

        basicAuthhorisationToken = base64Token(key: key, secret: secret)
    }
    
    func findImages(with hashtag: String, completion: @escaping SearchCompletion ) {
        if accessToken.isEmpty {
            authorisationToken() { [weak self] authCompletion in
                self?.searchImage(with: hashtag, completion: completion)
            }
        } else {
            self.searchImage(with: hashtag, completion: completion)
        }
    }
    
    func authorisationToken(completion:@escaping AuthorisationCompletion) {
        let url = URL(string: "https://api.twitter.com/oauth2/token")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Basic \(self.basicAuthhorisationToken)", forHTTPHeaderField: "Authorization")
        request.httpBody = "grant_type=client_credentials".data(using: .utf8)
        let task = session.dataTask(with: request) {  [weak self] (data, response, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let responseModel = try! jsonDecoder.decode(AccessTokenResponse.self, from: data)
                self?.accessToken = responseModel.access_token!
                completion(nil)
            } else {
                self?.service(error:error as NSError?,completion:AuthorisationAction(completion:completion))
            }

        }
        
        task.resume()
    }
    
    func searchImage(with hashtag: String, completion:@escaping SearchCompletion) {
        let strURL = "https://api.twitter.com/1.1/search/tweets.json?q=\(hashtag.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)+-filter%3Aretweets&f=images&include_entities=true&tweet_mode=extended&result_type=recent&count=50"
        
        let url = URL(string: strURL)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(self.accessToken)", forHTTPHeaderField: "Authorization")
        let task = session.dataTask(with: request) {  (data, response, error) in
            
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                                
                let responseModel = try! jsonDecoder.decode(SearchResponse.self, from: data)
                
                
                let urls = responseModel.statuses.flatMap {
                    $0.extendedEntities?.media.map {
                        $0.mediaURL
                    }
                    }.flatMap{ $0 }
                
                completion(urls,nil)
            } else {
                self.service(error: error as NSError?, completion: SearchAction(completion: completion))
            }
        }
        
        task.resume()
    }
    
    func service(error:NSError?,completion:CompletionAction) {
        if error == nil {

            completion.add(error:NSError(domain: "WebService",
                                code: Int.max-1,
                                userInfo: [NSLocalizedDescriptionKey : "Unknown error"]))
        } else {
            completion.add(error: error!)
        }
        completion.run()
    }
}

internal func base64Token(key:String,secret:String) -> String {
    let string = key + ":" + secret
    let data = string.data(using: .utf8)
    guard let base64data = data?.base64EncodedString() else {
        return ""
    }
    return base64data
}
