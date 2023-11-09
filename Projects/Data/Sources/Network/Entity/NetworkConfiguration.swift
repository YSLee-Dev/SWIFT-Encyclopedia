//
//  NetworkConfiguration.swift
//  Data
//
//  Created by 이윤수 on 11/9/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

enum NetworkConfiguration {
    enum URL: String {
        case scheme = "https"
        case host = "openapi.naver.com"
        case path = "/v1/search/encyc.json"
    }

    enum Query: String {
        case query
        case display
        case start
    }
}
