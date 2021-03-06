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

struct CollectionViewState: State, ColorComponentState {
    var words: [String] = []
    var color: NSColor = .white
    var sections: [DefaultSectionModel] = []
    var error: (Error, Action)? = nil
}

class ViewModel: RootViewModelType<CollectionViewState> {

    let sections = Output<[DefaultSectionModel]>(value: [])
    
    override init() {
        super.init()
        store.set(
            initialState: CollectionViewState(),
            middlewares: [
                logActionToConsole
            ],
            reducers: [
                wordsReducer,
                colorReducer
            ],
            postwares: [
               makeSectionModel
            ])
    }
    
    override func on(newState: CollectionViewState) {
        sections.accept(newState.sections)
        propagate(state: newState)
    }
}
