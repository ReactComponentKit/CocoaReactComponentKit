//
//  NameItem.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2018. 10. 21..
//  Copyright © 2018년 Burt.K. All rights reserved.
//

import Cocoa
import CocoaReactComponentKit
import SnapKit

class LabelComponent: NSViewComponent {
    
    lazy var label: NSTextField = {
        let textField = NSTextField()
        textField.backgroundColor = NSColor.clear
        textField.maximumNumberOfLines = 1
        textField.isBordered = false
        textField.isEditable = false
        textField.alignment = .center
        return textField
    }()
    
    override func prepareForReuse() {
        label.stringValue = ""
    }
    
    override func setupView() {
        addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    override func configure<Item>(item: Item) {
        guard let labelItem = item as? LabelItem else { return }
        label.stringValue = labelItem.text
    }
}
