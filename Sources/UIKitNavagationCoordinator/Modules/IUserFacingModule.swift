//
//  IUserFacingModule.swift
//  UIKitNavagationCoordinator
//
//  Created by Alexander Tokarev on 23/03/23.
//

import UIKit

protocol IUserFacingModule: AnyObject {
    var rootView: UIViewController { get }
    var coordinator: any INavigationCoordinator { get }
}

extension IUserFacingModule {
    var rootView: UIViewController { self.coordinator.rootViewController }
}
