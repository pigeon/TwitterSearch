//
//  FullScreenFullScreenConfigurator.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 03/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import UIKit

class FullScreenModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? FullScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: FullScreenViewController) {
        let presenter = FullScreenPresenter()
        presenter.view = viewController
        viewController.output = presenter
    }
}
