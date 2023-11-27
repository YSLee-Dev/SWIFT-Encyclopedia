//
//  EncyclopediaSection.swift
//  Domain
//
//  Created by 이윤수 on 11/27/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import RxDataSources

public struct EncyclopediaSection: AnimatableSectionModelType {
    public let id: String
    public var items: [Item]
}

extension EncyclopediaSection {
    public typealias Item = EncyclopediaData
    public typealias Identity = String
    
    public var identity: String {
        self.id
    }
    
    public init(original: EncyclopediaSection, items: [EncyclopediaData]) {
        self = original
        self.items = items
    }
}
