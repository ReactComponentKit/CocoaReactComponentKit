//
//  WindowController.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2018. 10. 21..
//  Copyright © 2018년 Burt.K. All rights reserved.
//

import Cocoa
import BKEventBus

class WindowController: NSWindowController, NSWindowDelegate {
    
    enum Event: EventType {
        case windowDidResize
    }

    private let eventBus = EventBus<WindowController.Event>()
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }

    func windowDidResize(_ notification: Notification) {
        eventBus.post(event: .windowDidResize)
    }
}
