//
//  MainEncyclopediaUsecase.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/7/23.
//

import Foundation

import RxSwift

public class MainEncyclopediaUsecase: MainEncyclopediaUsecaseProtocol {
    let repository: MainEncyclopediaRepositoryProtocol
    
    public init(
        repository: MainEncyclopediaRepositoryProtocol
    ) {
        self.repository = repository
    }
    
    public func encyclopediaDataLoad(query: String) -> Observable<[EncyclopediaData]> {
        self.repository.encyclopediaDataLoad(query: query)
            .asObservable()
    }
}
