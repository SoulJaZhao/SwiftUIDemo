// swift-tools-version:5.9

import PackageDescription

let package = Package(
  name: "QuickSwiftUIAPI",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "QuickSwiftUIAPI", targets: ["QuickSwiftUIAPI"]),
  ],
  dependencies: [
    .package(url: "https://gitee.com/mirrors_apollographql/apollo-ios", exact: "1.25.3"),
  ],
  targets: [
    .target(
      name: "QuickSwiftUIAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
  ]
)
