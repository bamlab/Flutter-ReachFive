// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "flutter_reach_five_ios",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "flutter-reach-five-ios", type: .static, targets: ["flutter_reach_five_ios"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(url: "https://github.com/ReachFive/reachfive-ios.git", .upToNextMajor(from: "10.0.0")),
        .package(url: "https://github.com/ReachFive/reachfive-ios-facebook.git", .upToNextMajor(from: "8.0.0")),
        .package(url: "https://github.com/ReachFive/reachfive-ios-google.git", .upToNextMajor(from: "8.0.0")),
    ],
    targets: [
        .target(
            name: "flutter_reach_five_ios",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "Reach5", package: "reachfive-ios"),
                .product(name: "Reach5Facebook", package: "reachfive-ios-facebook"),
                .product(name: "Reach5Google", package: "reachfive-ios-google"),
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy"),
            ]
        )
    ]
)
