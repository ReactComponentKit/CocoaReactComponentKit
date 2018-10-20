//
//  ViewModel.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2018. 10. 21..
//  Copyright © 2018년 Burt.K. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import BKRedux
import BKEventBus
import CocoaReactComponentKit

struct CollectionViewState: State {
    var error: (Error, Action)? = nil
}

class ViewModel: RootViewModelType<CollectionViewState> {
    let rx_sections =  BehaviorRelay<[DefaultSectionModel]>(value: [])
    
    override init() {
        super.init()
        store.set(
            initailState: CollectionViewState(),
            reducers: [
                :
            ],
            postwares: [
               
            ])
    }
    
    override func on(newState: CollectionViewState) {
        //rx_sections.accept(newState.sections)
    }
}
