//
//  DetailViewModel.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/28/23.
//

import Foundation
import Combine

import Domain

public class DetailViewModel: ObservableObject {
    public init() {
        
    }
    @Published var tapEncyclopediaData: EncyclopediaData = .init(id: "", title: "", description: "", url: nil, thumbnail: nil)
}
