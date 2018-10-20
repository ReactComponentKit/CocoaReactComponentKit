//
//  ViewController.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2018. 10. 20..
//  Copyright © 2018년 Burt.K. All rights reserved.
//

import Cocoa
import CocoaReactComponentKit
import SnapKit
import BKEventBus

class ViewController: NSViewController {
    
    private let viewModel = ViewModel()
    
    private let windowEventBus = EventBus<WindowController.Event>()
    
    private lazy var collectionViewComponent: NSCollectionViewComponent = {
        let component = NSCollectionViewComponent(token: self.viewModel.token)
        return component
    }()
    
    private let sectionItems = [
        LabelItem(text: "안녕하세요"),
        LabelItem(text: "반갑습니다"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요"),
        LabelItem(text: "다시만나요")
    ]
    
    private lazy var adapter: NSCollectionViewAdapter = {
        let adapter = NSCollectionViewAdapter(collectionViewComponent: self.collectionViewComponent)
        let section = DefaultSectionModel(items: sectionItems)
        adapter.set(section: section)
        return adapter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionViewComponent)
        collectionViewComponent.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        collectionViewComponent.register(component: LabelComponent.self)
        collectionViewComponent.adapter = adapter
        
        windowEventBus.on { [weak self] (event) in
            guard let strongSelf = self else { return }
            switch event {
            case .windowDidResize:
                strongSelf.collectionViewComponent.reloadData()
            }
        }
    }
}

