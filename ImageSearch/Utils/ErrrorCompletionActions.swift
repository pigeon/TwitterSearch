//
//  ErrrorCompletionActions.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 04/04/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import Foundation

typealias AuthorisationCompletion = (NSError?)->Void
typealias SearchCompletion =  ([String]?,NSError?) -> Void


protocol CompletionAction {
    func add(error:NSError)
    func run()
}

class AuthorisationAction : CompletionAction {
    
    var err:NSError?
    let handler:AuthorisationCompletion
    
    init(completion:@escaping AuthorisationCompletion) {
        handler = completion
    }
    
    func add(error:NSError) {
        err = error
    }
    
    func run() {
        handler(err)
    }
}

class SearchAction : CompletionAction {
    
    var err:NSError?
    let handler:SearchCompletion
    
    init(completion:@escaping SearchCompletion) {
        handler = completion
    }
    
    func run() {
        handler(nil,err)
    }
    
    func add(error:NSError) {
        err = error
    }
    
}
