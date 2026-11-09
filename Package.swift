// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "AtomeSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "AtomeSDK",
            targets: ["AtomeSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "AtomeSDK",
            url: "https://github.com/Atome-FE/AtomeMerchantDemo-iOS/releases/download/0.1.2/AtomeSDK.xcframework.zip",
            checksum: "4ff67260c17fea24c214964b592b15f834502a373e81fc14bb0d257cef851e06"
        )
    ]
)

