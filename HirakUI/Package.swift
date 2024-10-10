//
//  Package.swift
//  HirakUI
//
//  Created by Hirakjyoti Borah on 10/10/24.
//

// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HirakUI",
    platforms: [
        .iOS(.v11) // Adjust according to your minimum deployment target
    ],
    products: [
        .library(
            name: "HirakUI",
            targets: ["HirakUI"]
        ),
    ],
    targets: [
        .target(
            name: "HirakUI",
            path: "HirakUI"
        ),
        .testTarget(
            name: "HirakUITests",
            dependencies: ["HirakUI"],
            path: "HirakUITests"
        ),
    ]
)
