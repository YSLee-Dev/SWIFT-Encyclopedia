//
//  EncyclopediaDataDTO.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/7/23.
//

import Foundation

import Domain

struct EncyclopediaDataDTO: Decodable {
    let items: [EncyclopediaItem]
    let start: Int
    
    func toDomain() -> [EncyclopediaData] {
        self.items.map {
            EncyclopediaData(
                id: $0.title + $0.description + $0.link + "\(self.start)",
                title: $0.title,
                description: $0.description,
                url: URL(string: $0.link)
            )
        }
    }
}

struct EncyclopediaItem: Decodable {
    let title: String
    let description: String
    let link: String
}
