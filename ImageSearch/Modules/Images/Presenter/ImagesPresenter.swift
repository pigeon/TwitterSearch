//
//  ImagesImagesPresenter.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

class ImagesPresenter: ImagesModuleInput, ImagesViewOutput, ImagesInteractorOutput {

    weak var view: ImagesViewInput!
    var interactor: ImagesInteractorInput!
    var router: ImagesRouterInput!

    func viewIsReady() {

    }
}
