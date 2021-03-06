// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FarmhouseCore",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v9)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "FarmhouseCore",
            targets: ["FarmhouseCore"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/simonedelmann/crud-kit.git", from: "1.0.4"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.1.0")
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "FarmhouseCore",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "CRUDKit", package: "crud-kit"),
        ]),
        .testTarget(
            name: "FarmhouseCoreTests",
            dependencies: ["FarmhouseCore"]),
    ]
)
