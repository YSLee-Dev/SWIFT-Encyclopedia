//
//  EncyclopediaData.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/7/23.
//

import Foundation

import RxDataSources

public struct EncyclopediaData: IdentifiableType, Equatable {
    let id: String
    public let title: String
    public let description: String
    public let url: URL?
    public let thumbnail: URL?
    
    public init(
        id: String,
        title: String,
        description: String,
        url: URL?,
        thumbnail: URL?
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.url = url
        self.thumbnail = thumbnail
    }
}

extension EncyclopediaData {
    public var identity: String {
        self.id
    }
}
