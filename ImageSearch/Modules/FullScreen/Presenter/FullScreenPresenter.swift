//
//  FullScreenFullScreenPresenter.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 03/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

class FullScreenPresenter: FullScreenModuleInput, FullScreenViewOutput {
    weak var view: FullScreenViewInput!

    func viewIsReady() {
    }

    func imageStringURL() -> String {
        return imageURL
    }

    var imageURL: String = "" {
        didSet {
        }
    }
}
