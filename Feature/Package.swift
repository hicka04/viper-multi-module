// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Feature",
            targets: [
                "ArticleSearch"
            ]
        )
    ],
    dependencies: [
        .package(path: "../Logic")
    ],
    targets: [
        .target(
            name: "ArticleSearch",
            dependencies: ["ArticleDetail"]
        ),
        .testTarget(
            name: "ArticleSearchTests",
            dependencies: ["ArticleSearch"]
        ),
        .target(
            name: "ArticleDetail",
            dependencies: []
        ),
        .testTarget(
            name: "ArticleDetailTests",
            dependencies: ["ArticleDetail"]
        )
    ]
)
