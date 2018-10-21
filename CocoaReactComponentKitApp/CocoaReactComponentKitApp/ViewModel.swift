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
    var words: [String] = []
    var sections: [SectionModel] = []
    var error: (Error, Action)? = nil
}

class ViewModel: RootViewModelType<CollectionViewState> {
    
    struct Output {
        let sections =  BehaviorRelay<[SectionModel]>(value: [])
    }
    
    let output = Output()
    
    
    
    override init() {
        super.init()
        store.set(
            initailState: CollectionViewState(),
            middlewares: [
                logActionToConsole
            ],
            reducers: [
                StateKeyPath(\CollectionViewState.words) : wordsReducer
            ],
            postwares: [
               makeSectionModel
            ])
    }
    
    override func on(newState: CollectionViewState) {
        output.sections.accept(newState.sections)
    }
}
