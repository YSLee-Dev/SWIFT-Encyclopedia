//
//  MainEncyclopediaRepositoryProtocol.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/7/23.
//

import Foundation

import RxSwift

public protocol MainEncyclopediaRepositoryProtocol {
    func encyclopediaDataLoad(query: String) -> Single<[EncyclopediaData]>
}
