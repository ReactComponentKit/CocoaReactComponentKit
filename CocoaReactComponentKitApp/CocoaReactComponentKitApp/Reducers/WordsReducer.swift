//
//  WordsReducer.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2018. 10. 21..
//  Copyright © 2018년 Burt.K. All rights reserved.
//

import Foundation

import Foundation
import BKRedux
import RxSwift

func wordsReducer(state: State, action: Action) -> Observable<State> {
    guard
        let act = action as? AddWordAction,
        var mutableState = state as? CollectionViewState
    else {
        return .just(state)
    }
    
    mutableState.words.append(act.word)
    
    return .just(mutableState)
}
