//
//  IScreenFactory.swift
//  UIKitNavagationCoordinator
//
//  Created by Alexander Tokarev on 23/03/23.
//

import UIKit

public protocol IScreenFactory<RD>: AnyObject {
    associatedtype RD: IRoutingDestination

    var coordinator: (any INavigationCoordinator<RD>)? { get set }
    func view(for: RD) -> UIViewController
}
