//
//  LabelItem.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2018. 10. 21..
//  Copyright © 2018년 Burt.K. All rights reserved.
//

import CocoaReactComponentKit

struct LabelItem: ItemModel {
    var id: Int {
        return text.hashValue
    }
    
    var componentClass: NSViewComponent.Type {
        return LabelComponent.self
    }
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    func contentSize(in view: NSView) -> CGSize {
        return CGSize(width: 100, height: 30)
    }
}
