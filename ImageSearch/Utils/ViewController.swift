//
//  ViewController.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 04/04/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showError(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func show(error:NSError) {
        self.showError(title: "Error", message: error.localizedDescription)
    }
}
