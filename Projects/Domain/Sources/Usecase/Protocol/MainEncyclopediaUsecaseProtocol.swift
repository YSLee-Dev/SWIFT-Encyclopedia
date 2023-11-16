//
//  MainEncyclopediaUsecaseProtocol.swift
//  Domain
//
//  Created by 이윤수 on 11/15/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import RxSwift

public protocol MainEncyclopediaUsecaseProtocol {
    func encyclopediaDataLoad(query: String) -> Observable<[EncyclopediaData]>
}
