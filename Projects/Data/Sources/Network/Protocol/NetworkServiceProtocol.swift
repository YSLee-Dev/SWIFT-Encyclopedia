//
//  NetworkServiceProtocol.swift
//  Data
//
//  Created by 이윤수 on 11/9/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import RxSwift

public protocol NetworkServiceProtocol {
    func request<T: Decodable>(
        url: URLComponents,
        decodingType: T.Type,
        method: URLSessionMethod
    ) -> Single<Result<T, URLError>>
}
