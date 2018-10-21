//
//  MakeSectionModel.swift
//  CocoaReactComponentKitApp
//
//  Created by burt on 2018. 10. 21..
//  Copyright © 2018년 Burt.K. All rights reserved.
//

import Foundation

import Foundation
import BKRedux
import RxSwift
import CocoaReactComponentKit

func makeSectionModel(state: State, action: Action) -> Observable<State> {
    guard var mutableState = state as? CollectionViewState else { return .just(state) }

    let labelItemModelList = mutableState.words.map(LabelItem.init)
    let section = DefaultSectionModel(items: labelItemModelList)
    
    mutableState.sections = [section]
    
    return .just(mutableState)
}
