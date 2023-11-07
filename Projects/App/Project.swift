//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/7/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "SWIFT-Encyclopedia",
    platform: .iOS,
    product: .app,
    dependencies: [
        .project(target: "Data", path: .relativeToRoot("Projects/Data"))
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
