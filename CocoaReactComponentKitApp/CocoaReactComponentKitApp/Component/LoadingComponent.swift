//
//  LoadingComponent.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2019. 1. 20..
//  Copyright © 2019년 Burt.K. All rights reserved.
//

import Cocoa
import CocoaReactComponentKit

class LoadingComponent: NSViewControllerComponent {
    
    @IBOutlet weak var progress: NSProgressIndicator!
    
    static func viewControllerComponent() -> LoadingComponent {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        return viewControllerComponent(identifier: "LoadingComponent", storyboard: storyboard) as! LoadingComponent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.startAnimation(nil)
    }
}
