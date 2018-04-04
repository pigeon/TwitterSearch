//
//  AccessTokenResponse.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 04/04/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import Foundation


struct AccessTokenResponse : Codable {
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
