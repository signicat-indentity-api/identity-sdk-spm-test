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
            targets: ["IdentitySDK"]
        )
    ],
    targets: [
        /// The binary XCFramework target
        .binaryTarget(
            name: "IdentitySDK",
            url: "https://github.com/signicat-indentity-api/identity-sdk-ios/archive/refs/tags/v3.2.2.zip",
            checksum: "4e19a91853585038dc600a4f7a5d59cf4737bbc2bc97eee7590747cf4d4b0447"
        )
    ]
)

