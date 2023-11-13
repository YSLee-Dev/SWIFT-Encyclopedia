//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/13/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Main",
    product: .staticFramework,
    dependencies: [
        .project(target: "Domain", path: .relativeToRoot("Projects/Domain")),
        .project(target: "Common", path: .relativeToRoot("Projects/Common")),
        .external(name: "Swinject"),
        .external(name: "SnapKit"),
        .external(name: "RxSwift"),
        .external(name: "RxCocoa"),
        .external(name: "Then")
    ],
    resources: ["Resources/**"]
)

