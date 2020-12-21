//
//  FullScreenFullScreenViewOutput.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 03/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

protocol FullScreenViewOutput {
    /**
     @author Dmytro Golub
     Notify presenter that view is ready
     */

    func viewIsReady()
    func imageStringURL() -> String
}
