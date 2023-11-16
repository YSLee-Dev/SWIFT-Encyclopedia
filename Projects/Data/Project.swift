//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/7/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Data",
    product: .staticFramework,
    dependencies: [
        .project(target: "Domain", path: .relativeToRoot("Projects/Domain")),
        .external(name: "RxSwift"),
        .external(name: "RxCocoa"),
        .external(name: "Nimble")
    ],
    resources: ["Resources/**"],
    testDependencies: [
        .external(name: "RxTest"),
        .external(name: "RxBlocking")
    ]
)
