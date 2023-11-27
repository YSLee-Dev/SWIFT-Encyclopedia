//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/7/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Domain",
    product: .staticFramework,
    dependencies: [
        .external(name: "RxSwift"),
        .external(name: "RxOptional"),
        .external(name: "RxDataSources")
    ],
    resources: ["Resources/**"]
)
