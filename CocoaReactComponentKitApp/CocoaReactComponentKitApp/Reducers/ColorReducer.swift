//
//  ColorReducer.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2019. 1. 19..
//  Copyright © 2019년 Burt.K. All rights reserved.
//


import Foundation

import Foundation
import BKRedux
import RxSwift

func colorReducer(state: State, action: Action) -> Observable<State> {
    guard
        let act = action as? ColorComponent.ChangeColorAction,
        var mutableState = state as? CollectionViewState
    else {
        return .just(state)
    }
    
    mutableState.color = act.color
    
    return .just(mutableState)
}
