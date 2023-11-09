//
//  URLSession+.swift
//  Data
//
//  Created by 이윤수 on 11/9/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

extension URLSession: URLSessionProtocol {
    func request(_ request: URLRequest) -> RxSwift.Observable<(response: HTTPURLResponse, data: Data)> {
        self.rx.response(request: request)
    }
}
