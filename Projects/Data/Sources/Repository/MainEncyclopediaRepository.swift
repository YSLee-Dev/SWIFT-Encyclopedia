//
//  MainEncyclopediaRepository.swift
//  Data
//
//  Created by 이윤수 on 11/15/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import Domain

import RxSwift
import RxOptional

public class MainEncyclopediaRepository: MainEncyclopediaRepositoryProtocol {
    let networkService: NetworkServiceProtocol
    
    public init(
        networkService: NetworkServiceProtocol = NetworkService()
    ) {
        self.networkService = networkService
    }
    
    public func encyclopediaDataLoad(query: String, page: Int) -> Single<[EncyclopediaData]> {
        var urlComponents = URLComponents()
        urlComponents.scheme = NetworkConfiguration.URL.scheme.rawValue
        urlComponents.host = NetworkConfiguration.URL.host.rawValue
        urlComponents.path = NetworkConfiguration.URL.path.rawValue
        urlComponents.queryItems = [
            URLQueryItem(name: NetworkConfiguration.Query.start.rawValue, value: "\(page)"),
            URLQueryItem(name: NetworkConfiguration.Query.query.rawValue, value: query),
            URLQueryItem(name: NetworkConfiguration.Query.display.rawValue, value: "30")
        ]
        
        return self.networkService.request(
            url: urlComponents,
            decodingType: EncyclopediaDataDTO.self,
            method: .GET
        )
        .map { data -> [EncyclopediaData]? in
            guard case .success(let value) = data else {return nil}
            return value.toDomain()
        }
        .asObservable()
        .replaceNilWith([])
        .asSingle()
    }
}
