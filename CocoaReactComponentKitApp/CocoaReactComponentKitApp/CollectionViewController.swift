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
import RxSwift
import RxCocoa

class CollectionViewController: NSViewController {
    
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    private let windowEventBus = EventBus<WindowController.Event>()
    
    private lazy var collectionViewComponent: NSCollectionViewComponent = {
        let component = NSCollectionViewComponent(token: self.viewModel.token)
        return component
    }()
    
    private lazy var addButton: NSButton = {
        let button = NSButton(frame: .zero)
        button.title = "Add"
        button.setButtonType(.momentaryLight)
        button.bezelStyle = .rounded
        return button
    }()
    
    private lazy var adapter: NSCollectionViewAdapter = {
        let adapter = NSCollectionViewAdapter(collectionViewComponent: self.collectionViewComponent)
        let section = DefaultSectionModel(items: [])
        adapter.set(section: section)
        return adapter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionViewComponent)
        view.addSubview(addButton)
    
        addButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        collectionViewComponent.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(addButton.snp.top).offset(-16)
        }
        collectionViewComponent.register(component: LabelComponent.self)
        collectionViewComponent.adapter = adapter
        
        addButton.rx.tap.map { AddWordAction() }.bind(onNext: viewModel.dispatch).disposed(by: disposeBag)
        
        viewModel
            .output
            .sections
            .asDriver()
            .drive(onNext: { [weak self] (sectionModelList) in
                self?.adapter.set(sections: sectionModelList)
            })
            .disposed(by: disposeBag)
    }
}

