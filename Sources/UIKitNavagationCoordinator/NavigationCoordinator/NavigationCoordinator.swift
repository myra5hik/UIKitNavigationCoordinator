//
//  NavigationCoordinator.swift
//  UIKitNavagationCoordinator
//
//  Created by Alexander Tokarev on 22/03/23.
//

import UIKit

final class NavigationCoordinator<Destination: IRoutingDestination>: INavigationCoordinator {
    // Public
    var rootViewController: UIViewController { navigationController }
    // Private
    private let navigationController: UINavigationController
    private var presentingController: UIViewController {
        navigationController.presentedViewController ?? navigationController.topViewController ?? navigationController
    }
    private let root: Destination
    // Dependencies
    private let factory: any IScreenFactory<Destination>

    init(root: Destination, factory: some IScreenFactory<Destination>, navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController ?? UINavigationController(rootViewController: UIViewController())
        self.factory = factory
        self.root = root
    }

    func start(animated: Bool = true) {
        push(root, animated: animated)
    }

    func startModally(on controller: UIViewController, fullScreen: Bool, animated: Bool) {
        start(animated: false)
        navigationController.modalPresentationStyle = fullScreen ? .fullScreen : .formSheet
        controller.present(navigationController, animated: animated)
    }

    func push(_ destination: Destination, animated: Bool = true) {
        assert(Thread.isMainThread)
        let view = factory.view(for: destination)
        navigationController.pushViewController(view, animated: animated)
    }

    func pop(animated: Bool = true) {
        assert(Thread.isMainThread)
        if navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: animated)
        }
    }

    func present(_ destination: Destination, animated: Bool = true) {
        assert(Thread.isMainThread)
        showModal(destination, using: .formSheet, animated: animated)
    }

    func overlay(_ destination: Destination, animated: Bool = true) {
        assert(Thread.isMainThread)
        showModal(destination, using: .overFullScreen, animated: animated)
    }

    func dismiss(animated: Bool = true) {
        assert(Thread.isMainThread)
        presentingController.dismiss(animated: animated)
    }
}

// MARK: - Private Helpers

private extension NavigationCoordinator {
    func showModal(_ destination: Destination, using style: UIModalPresentationStyle, animated: Bool) {
        let view = factory.view(for: destination)
        view.modalPresentationStyle = style
        presentingController.present(view, animated: animated)
    }
}
