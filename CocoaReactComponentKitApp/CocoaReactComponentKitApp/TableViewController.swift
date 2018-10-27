//
//  TablieViewController.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2018. 10. 21..
//  Copyright © 2018년 Burt.K. All rights reserved.
//

import Cocoa
import CocoaReactComponentKit
import RxSwift
import RxCocoa

class TableViewController: NSViewController {

    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    private lazy var tableViewComponent: NSTableViewComponent = {
        let component = NSTableViewComponent(token: self.viewModel.token)
        return component
    }()
    
    private lazy var addButton: NSButton = {
        let button = NSButton(frame: .zero)
        button.title = "Add"
        button.setButtonType(.momentaryLight)
        button.bezelStyle = .rounded
        return button
    }()
    
    private lazy var adapter: NSTableViewAdapter = {
        let adapter = NSTableViewAdapter(tableViewComponent: self.tableViewComponent, useDiff: true)
        let section = DefaultSectionModel(items: [])
        adapter.set(section: section)
        return adapter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableViewComponent)
        view.addSubview(addButton)
        
        addButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        tableViewComponent.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(addButton.snp.top).offset(-16)
        }
        
        tableViewComponent.register(component: LabelComponent.self)
        tableViewComponent.adapter = adapter
        
        addButton.rx.tap.map { AddWordAction() }.bind(to: viewModel.rx_action).disposed(by: disposeBag)
        
        viewModel
            .output
            .sections
            .asDriver()
            .drive(onNext: { [weak self] (sectionModelList) in
                guard sectionModelList.isEmpty == false else { return }
                self?.adapter.set(section: sectionModelList[0])
            })
            .disposed(by: disposeBag)
    }
}
