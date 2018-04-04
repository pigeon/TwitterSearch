//
//  ImagesImagesInteractor.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import Foundation

class ImagesInteractor: ImagesInteractorInput {

    weak var output: ImagesInteractorOutput!
    let twitterSearch:TwitterSearchService

    init(service:TwitterSearchService = TwitterSearchServiceImpl()) {
        twitterSearch = service
    }
    
    func search(with hashtag: String) {
        twitterSearch.findImages(with: hashtag) { res,error  in
            if let res = res {
                DispatchQueue.main.async {
                    self.output.images(res)
                }
            } else {
                self.output.error(error!)
            }
        }
    }
    
}
