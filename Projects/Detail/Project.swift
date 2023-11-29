//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/28/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Detail",
    product: .staticFramework,
    dependencies: [
        .project(target: "Domain", path: .relativeToRoot("Projects/Domain")),
        .project(target: "Common", path: .relativeToRoot("Projects/Common")),
        .external(name: "Swinject"),
        .external(name: "Kingfisher")
    ],
    resources: ["Resources/**"]
)
