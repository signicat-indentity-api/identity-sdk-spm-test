// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let checksum: String = "d7d90a21b4e8c83970ce0e70e5c4db83784505aa99a1ee33a1348eab586a28e3"

let dependencies: [Target.Dependency] = [
    .product(name: "VideoIDSDK", package: "videoidskd-spm")
]

let package = Package(
    name: "IdentitySDK",
    platforms: [
        .iOS("15.0") // or your minimum supported version
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IdentitySDK",
            targets: ["IdentitySDK", "_IdentitySDKStub"]
        ),
    ],
    
    dependencies: [
        .package(url: "https://github.com/signicat/videoidskd-spm.git", exact: "1.38.1")
    ],

    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "_IdentitySDKStub", dependencies: dependencies),
        .binaryTarget(
            name: "IdentitySDK",
            url: "https://github.com/signicat-indentity-api/identity-sdk-ios/archive/refs/tags/v3.2.1.zip",
            checksum: checksum
        )
    ]
)
