//
//  EncyclopediaData.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/7/23.
//

import Foundation

public struct EncyclopediaData {
    let title: String
    let description: String
    let url: URL?
    
    public init(
        title: String,
        description: String,
        url: URL?
    ) {
        self.title = title
        self.description = description
        self.url = url
    }
}
