// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Tomorrow",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9),
        .watchOS(.v2),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "Tomorrow",
            targets: ["Tomorrow"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Tomorrow",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "TomorrowTests",
            dependencies: ["Tomorrow"],
            path: "Tests"
        ),
    ]
)
