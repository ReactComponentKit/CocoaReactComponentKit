//
//  NSViewComponent.swift
//  CocoaReactComponentKit
//
//  Created by burt on 2018. 10. 20..
//  Copyright © 2018년 Burt.K. All rights reserved.
//

import Cocoa
import BKEventBus
import BKRedux

open class NSViewComponent: NSView, ReactComponent, ContentSizeProvider {
    public var token: Token
    public var newStateEventBus: EventBus<ComponentNewStateEvent>? = nil
    public var dispatchEventBus: EventBus<ComponentDispatchEvent>
    
    open func contentSize(in view: NSView) -> CGSize {
        return .zero
    }
    
    public required init(token: Token, canOnlyDispatchAction: Bool = false) {
        self.token = token
        self.dispatchEventBus = EventBus(token: token)
        if canOnlyDispatchAction == false {
            self.newStateEventBus = EventBus(token: token)
        }
        super.init(frame: .zero)
        self.newStateEventBus?.on { [weak self] (event) in
            guard let strongSelf = self else { return }
            switch event {
            case let .on(state):
                strongSelf.applyNew(state: state)
            }
        }
        
        self.setupView()
        invalidateIntrinsicContentSize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Override it to layout sub views.
    open func setupView() {
        
    }
    
    // It is only called when the component is in NSTableView's cell or NSCollectionView's cell.
    open override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    // It is called when the component is standalone.
    func applyNew(state: State) {
        on(state: state)
        invalidateIntrinsicContentSize()
    }
    
    // Override it to configure or update views
    open func on(state: State) {
        
    }
    
    // It is only called when the component is in NSTableView's cell or NSCollectionView's cell
    func applyNew<Item>(item: Item, at indexPath: IndexPath) {
        configure(item: item, at: indexPath)
        invalidateIntrinsicContentSize()
    }
    
    // Override it to configure or update views
    open func configure<Item>(item: Item, at indexPath: IndexPath) {
        
    }
    
    // Use it to dispatch actions
    public func dispatch(action: Action) {
        dispatchEventBus.post(event: .dispatch(action: action))
    }
}
