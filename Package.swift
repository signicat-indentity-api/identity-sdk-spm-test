// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IdentitySDKTest",
    platforms: [
        .iOS("15.0") // or your minimum supported version
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IdentitySDKTest",
            targets: ["IdentitySDK", "_IdentitySDKStub"]
        ),
    ],
    
    dependencies: [
        .package(
            url: "https://github.com/signicat/videoidskd-spm",
            .exact("1.33.0")
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "_IdentitySDKStub"),
        .binaryTarget(
            name: "IdentitySDK",
            url: "https://github.com/signicat-indentity-api/identity-sdk-ios/archive/refs/tags/v3.2.0.zip",
            checksum: "63a3a0fd357ff4b07d59489303305f07d174b5054e53657d1037660a54864792"
        ),
        // If you need to expose the dependency to consumers, you can add a target that depends on both:
        // .target(
        //     name: "IdentitySDKWrapper",
        //     dependencies: [
        //         "IdentitySDK",
        //         .product(name: "VideoIDSDK", package: "videoidskd-spm")
        //     ]
        // ),
    ]
)
