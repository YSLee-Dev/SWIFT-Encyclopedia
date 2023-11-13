//
//  URLSessionProtocol.swift
//  Data
//
//  Created by 이윤수 on 11/9/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import RxSwift

protocol URLSessionProtocol {
    func request(_ request: URLRequest) -> Observable<(response: HTTPURLResponse, data: Data)>
}
