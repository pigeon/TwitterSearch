//
//  FullScreenFullScreenInitializer.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 03/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import UIKit

class FullScreenModuleInitializer: NSObject {
    // Connect with object on storyboard
    @IBOutlet var fullscreenViewController: FullScreenViewController!

    override func awakeFromNib() {
        let configurator = FullScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: fullscreenViewController)
    }
}
