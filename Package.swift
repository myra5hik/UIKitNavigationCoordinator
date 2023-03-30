// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitNavagationCoordinator",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "UIKitNavagationCoordinator",
            targets: ["UIKitNavagationCoordinator"]
        ),
    ],
    targets: [
        .target(
            name: "UIKitNavagationCoordinator",
            dependencies: []
        )
    ]
)
