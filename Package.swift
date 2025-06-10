// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let checksum: String = "63a3a0fd357ff4b07d59489303305f07d174b5054e53657d1037660a54864792"

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
