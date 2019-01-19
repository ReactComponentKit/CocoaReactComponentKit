//
//  ColorViewController.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2019. 1. 19..
//  Copyright © 2019년 Burt.K. All rights reserved.
//

import Cocoa
import CocoaReactComponentKit
import SnapKit
import BKEventBus
import RxSwift
import RxCocoa

class ColorViewController: NSViewController {
    @IBOutlet weak var colorComponent: ColorComponent!
    
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorComponent.reset(token: viewModel.token)
    }
    
    @IBAction func clickChangeColor(_ sender: Any) {
        viewModel.dispatch(action: ColorComponent.ChangeColorAction())
    }
}
