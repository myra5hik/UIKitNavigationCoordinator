//
//  IUserFacingModule.swift
//  UIKitNavagationCoordinator
//
//  Created by Alexander Tokarev on 23/03/23.
//

import UIKit

public protocol IUserFacingModule: AnyObject {
    var rootView: UIViewController { get }
    var coordinator: any INavigationCoordinator { get }
}

public extension IUserFacingModule {
    var rootView: UIViewController { self.coordinator.rootViewController }
}
