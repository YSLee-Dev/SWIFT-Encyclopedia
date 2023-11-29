//
//  Dependencies.swift
//  Config
//
//  Created by 이윤수 on 11/8/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    swiftPackageManager: .init([
        .remote(
            url: "https://github.com/ReactiveX/RxSwift.git",
            requirement: .upToNextMajor(from: "6.5.0")
        ),
        .remote(
            url: "https://github.com/devxoul/Then",
            requirement: .upToNextMajor(from: "2")
        ),
        .remote(
            url: "https://github.com/SnapKit/SnapKit.git",
            requirement: .upToNextMajor(from: "5.0.1")
        ),
        .remote(
            url: "https://github.com/RxSwiftCommunity/RxDataSources.git",
            requirement: .upToNextMajor(from: "5.0.0")
        ),
        .remote(
            url: "https://github.com/Swinject/Swinject.git",
            requirement: .upToNextMajor(from: "2.8.0")
        ),
        .remote(
            url: "https://github.com/Quick/Nimble.git",
            requirement: .upToNextMajor(from: "12.0.0")
        ),
        .remote(
            url: "https://github.com/RxSwiftCommunity/RxOptional",
            requirement: .upToNextMajor(from: "5.0.0")
        ),
        .remote(
            url: "https://github.com/onevcat/Kingfisher.git",
            requirement: .upToNextMajor(from: "7.0.0")
        )
    ]),
    platforms: [
        .iOS
    ]
)
