//
//  EncyclopediaDataDTO.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/7/23.
//

import Foundation

struct EncyclopediaDataDTO: Decodable {
    let items: [EncyclopediaItem]
    let start: Int
}

struct EncyclopediaItem: Decodable {
    let title: String
    let description: String
    let link: String
}
