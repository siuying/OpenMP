// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenMP",
    platforms: [
        .iOS(.v13),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "OpenMP",
            targets: ["OpenMP"]),
    ],
    targets: [
        .target(
            name: "OpenMP",
            dependencies: [
                .byName(name: "OpenMP_Mac", condition: .when(platforms: [.macOS])),
                .byName(name: "OpenMP_iOS", condition: .when(platforms: [.iOS]))
            ]
        ),
        .binaryTarget(
            name: "OpenMP_Mac",
            path: "Sources/OpenMP_Mac/OpenMP.xcframework"
        ),
        .binaryTarget(
            name: "OpenMP_iOS",
            path: "Sources/OpenMP_iOS/OpenMP.xcframework"
        ),
        .testTarget(name: "OpenMPTests")
    ]
)
