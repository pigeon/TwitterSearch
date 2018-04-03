//
//  TwitterSearchService.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 01/04/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import Foundation

typealias SearchCompletion = ([String])->Void


struct TwitterAccessTokenResponse : Codable {
    let token_type : String?
    let access_token : String?
    
    enum CodingKeys: String, CodingKey {
        
        case token_type = "token_type"
        case access_token = "access_token"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token_type = try values.decodeIfPresent(String.self, forKey: .token_type)
        access_token = try values.decodeIfPresent(String.self, forKey: .access_token)
    }
    
}


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
    
    func findImages(with hashtag: String, completion: @escaping ([String]) -> Void) {
        if accessToken.isEmpty {
            authorisationToken() { [weak self] in
                self?.searchImage(with: hashtag, completion: completion)
            }
        } else {
            self.searchImage(with: hashtag, completion: completion)
        }
    }
    
    func authorisationToken(completion:@escaping ()->Void) {
        let url = URL(string: "https://api.twitter.com/oauth2/token")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Basic \(self.basicAuthhorisationToken)", forHTTPHeaderField: "Authorization")
        request.httpBody = "grant_type=client_credentials".data(using: .utf8)
        let task = session.dataTask(with: request) {  [weak self] (data, response, error) in
            let jsonDecoder = JSONDecoder()
            let responseModel = try! jsonDecoder.decode(TwitterAccessTokenResponse.self, from: data!)
            self?.accessToken = responseModel.access_token!
            completion()
        }
        
        task.resume()
    }
    
    func searchImage(with hashtag: String, completion: @escaping ([String]) -> Void) {
        let strURL = "https://api.twitter.com/1.1/search/tweets.json?q=\(hashtag.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)+-filter%3Aretweets&f=images&include_entities=true&tweet_mode=extended&result_type=recent&count=50"
        
        let url = URL(string: strURL)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(self.accessToken)", forHTTPHeaderField: "Authorization")
        let task = session.dataTask(with: request) {  (data, response, error) in
            let jsonDecoder = JSONDecoder()
            
            print(String(data:data!,encoding:.utf8)!)
            
            let responseModel = try! jsonDecoder.decode(SearchResponse.self, from: data!)

            
            let urls = responseModel.statuses.flatMap {
                $0.extendedEntities?.media.map {
                    $0.mediaURL
                }
                }.flatMap{ $0 }
            
            print(urls)
            completion(urls)
        }
        
        task.resume()
    }
    
}

internal func base64Token(key:String,secret:String) -> String {
    let string = key + ":" + secret
    let data = string.data(using: .utf8)
    guard let base64data = data?.base64EncodedString() else {
        fatalError("encoding error")
    }
    return base64data
}
