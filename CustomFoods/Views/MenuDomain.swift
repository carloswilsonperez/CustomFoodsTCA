//
//  MenuDomain.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 11/01/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import Combine


struct MenuDomainState: Equatable {

}

enum MenuDomainAction: Equatable {
    case didLinkTap
    case navigateToFoodListView
}

struct MenuDomainEnvironment {
    
}

let MenuDomainReducer = Reducer<MenuDomainState, MenuDomainAction, MenuDomainEnvironment> {
    state, action, _ in
    
    switch action {
    case .didLinkTap:
            print("Hello")
        return .none
        
    case .navigateToFoodListView:
        return .none
    }
    
}

