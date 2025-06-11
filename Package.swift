// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "IdentitySDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "IdentitySDK",
            targets: ["IdentitySDKWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/signicat/videoidskd-spm.git", exact: "1.38.1")
    ],
    targets: [
        /// Wrapper target to forward both the binary and the external SPM dependency.
        .target(
            name: "IdentitySDKWrapper",
            dependencies: [
                "IdentitySDK",
                .product(name: "VideoIDSDK", package: "videoidskd-spm")
            ],
            path: "Sources/IdentitySDKWrapper"
        ),

        /// The binary XCFramework target
        .binaryTarget(
            name: "IdentitySDK",
            url: "https://github.com/signicat-indentity-api/identity-sdk-ios/releases/download/v3.2.1/IdentitySDK.xcframework.zip",
            checksum: "d7d90a21b4e8c83970ce0e70e5c4db83784505aa99a1ee33a1348eab586a28e3"
        )
    ]
)
