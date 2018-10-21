//
//  LogActionToConsole.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2018. 10. 21..
//  Copyright © 2018년 Burt.K. All rights reserved.
//

import Foundation
import BKRedux
import RxSwift

func logActionToConsole(state: State, action: Action) -> Observable<State> {
    print("[Action] :: \(action)")
    return .just(state)
}
