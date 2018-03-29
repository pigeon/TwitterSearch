//
//  ImagesImagesConfigurator.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import UIKit

class ImagesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ImagesViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ImagesViewController) {

        let router = ImagesRouter()

        let presenter = ImagesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ImagesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
