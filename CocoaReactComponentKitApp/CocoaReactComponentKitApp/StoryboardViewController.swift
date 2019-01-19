//
//  StoryboardViewController.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2019. 1. 20..
//  Copyright © 2019년 Burt.K. All rights reserved.
//

import Cocoa
import CocoaReactComponentKit

class StoryboardViewController: NSViewController {
    private let viewModel = ViewModel()
    
    private lazy var loadingComponent: LoadingComponent = {
        return LoadingComponent.viewControllerComponent()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingComponent.reset(token: viewModel.token, receiveState: false)
        
        add(viewController: loadingComponent)
    }
    
}
