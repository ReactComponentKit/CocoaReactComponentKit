//
//  ColorComponent.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2019. 1. 19..
//  Copyright © 2019년 Burt.K. All rights reserved.
//

import Cocoa
import CocoaReactComponentKit
import BKRedux

protocol ColorComponentState {
    var color: NSColor { get }
}

class ColorComponent: NSViewComponent {
    
    @IBOutlet weak var colorA: NSView!
    @IBOutlet weak var colorB: NSView!
    @IBOutlet weak var colorC: NSView!
    
    override func setupView() {
        colorA.wantsLayer = true
        colorB.wantsLayer = true
        colorC.wantsLayer = true
    }
    
    override func on(state: State) {
        guard let state = state as? ColorComponentState else { return }
        colorA.layer?.backgroundColor = state.color.withAlphaComponent(0.7).cgColor
        colorB.layer?.backgroundColor = state.color.withAlphaComponent(0.4).cgColor
        colorC.layer?.backgroundColor = state.color.withAlphaComponent(0.1).cgColor
    }
}

extension ColorComponent {
    struct ChangeColorAction: Action {
        private let colors = [NSColor.red, NSColor.blue, NSColor.green, NSColor.yellow]
        let color: NSColor
        
        init() {
            color = colors.randomElement() ?? NSColor.red
        }
    }
}
