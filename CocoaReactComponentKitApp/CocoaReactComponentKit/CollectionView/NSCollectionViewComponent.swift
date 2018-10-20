//
//  NSCollectionViewComponent.swift
//  CocoaReactComponentKit
//
//  Created by burt on 2018. 10. 21..
//  Copyright © 2018년 Burt.K. All rights reserved.
//

import Cocoa

import BKRedux
import BKEventBus

import RxSwift
import RxCocoa

open class NSCollectionViewComponent: NSViewComponent {
    
    public enum ViewType {
        case cell
        case header
        case footer
    }
    
    public var adapter: NSCollectionViewAdapter? {
        didSet {
            collectionView.delegate = adapter
            collectionView.dataSource = adapter
            collectionView.reloadData()
        }
    }
    
    public let scrollViewCollectionView = NSScrollView()
    public let collectionView: NSCollectionView
    
    public var collectionViewLayout: NSCollectionViewLayout? {
        get {
            return collectionView.collectionViewLayout
        }
        
        set {
            collectionView.collectionViewLayout = newValue
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public required init(token: Token, canOnlyDispatchAction: Bool = true) {
        let defaultLayout =  NSCollectionViewFlowLayout()
        defaultLayout.scrollDirection = .vertical
        self.collectionView = NSCollectionView()
        self.collectionView.collectionViewLayout = defaultLayout
        self.collectionView.isSelectable = true
        super.init(token: token, canOnlyDispatchAction: canOnlyDispatchAction)
    }
    
    open override func setupView() {
        scrollViewCollectionView.documentView = collectionView
        addSubview(scrollViewCollectionView)
        scrollViewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollViewCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollViewCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollViewCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollViewCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        collectionView.backgroundColors = [.clear]
    }
    
    public func register<NSViewComponentType: NSViewComponent>(component: NSViewComponentType.Type, viewType: ViewType = .cell) {
        switch viewType {
        case .cell:
            let cellClass = CollectionViewComponentItem.self
            let identifier = NSUserInterfaceItemIdentifier(rawValue: String(describing: component))
            self.collectionView.register(cellClass, forItemWithIdentifier: identifier)
        case .header:
            let viewClass = CollectionSectionHeaderView.self
            let identifier = NSUserInterfaceItemIdentifier(String(describing: component))
            self.collectionView.register(viewClass, forSupplementaryViewOfKind: NSCollectionView.elementKindSectionHeader, withIdentifier: identifier)
        case .footer:
            let viewClass = CollectionSectionFooterView.self
            let identifier = NSUserInterfaceItemIdentifier(String(describing: component))
            self.collectionView.register(viewClass, forSupplementaryViewOfKind: NSCollectionView.elementKindSectionFooter, withIdentifier: identifier)
        }
        
    }
    
    open func reloadData() {
        self.collectionView.reloadData()
    }
}

