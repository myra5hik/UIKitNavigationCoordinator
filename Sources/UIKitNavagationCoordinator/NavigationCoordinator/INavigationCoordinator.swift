//
//  INavigationCoordinator.swift
//  UIKitNavagationCoordinator
//
//  Created by Alexander Tokarev on 30/03/23.
//

import UIKit

protocol INavigationCoordinator<Destination>: AnyObject {
    associatedtype Destination: IRoutingDestination

    var rootViewController: UIViewController { get }

    func start(animated: Bool)
    func startModally(on: UIViewController, fullScreen: Bool, animated: Bool)
    func push(_: Destination, animated: Bool)
    func pop(animated: Bool)
    func present(_: Destination, animated: Bool)
    func overlay(_: Destination, animated: Bool)
    func dismiss(animated: Bool)
}

extension INavigationCoordinator {
    func start() { start(animated: true) }
    func startModally(on: UIViewController) { startModally(on: on, fullScreen: false, animated: true) }
    func push(_ destination: Destination) { push(destination, animated: true) }
    func pop() { pop(animated: true) }
    func present(_ destination: Destination) { present(destination, animated: true) }
    func overlay(_ destination: Destination) { overlay(destination, animated: true) }
    func dismiss() { dismiss(animated: true) }
}
