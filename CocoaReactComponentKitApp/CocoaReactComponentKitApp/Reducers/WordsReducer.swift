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

func wordsReducer<S>(name: StateKeyPath<S>, state: StateValue?) -> (Action) -> Observable<(StateKeyPath<S>, StateValue?)> {
    return { (action) in
        guard
            let act = action as? AddWordAction,
            let prevState = state as? [String]
        else {
            return .just((name, state))
        }
        
        var mutableState = prevState
        mutableState.append(act.word)
        
        return .just((name, mutableState))
    }
}
