//
//  NetworkService.swift
//  Data
//
//  Created by 이윤수 on 11/9/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import RxSwift

class NetworkService: NetworkServiceProtocol {
    let urlSession: URLSession

    init (
        urlSession: URLSession = .shared
    ) {
        self.urlSession = urlSession
    }

    func request<T>(url: URLComponents, decodingType: T.Type, method: URLSessionMethod) -> Single<Result<T, URLError>> where T : Decodable {
        guard let url = url.url else {return .just(.failure(.init(.badURL)))}
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        let header = [
            "X-Naver-Client-Id": RequestToken.clientID,
            "X-Naver-Client-Secret": RequestToken.clientSecret
        ]
        header.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        return self.urlSession.request(request)
            .map { data in
                switch data.response.statusCode {
                case 200 ..< 299:
                    do {
                        let json = try JSONDecoder().decode(decodingType, from: data.data)
                        return .success(json)
                    } catch {
                        return .failure(.init(.cannotDecodeContentData))
                    }
                case 400 ..< 499:
                    return .failure(URLError(.clientCertificateRejected))
                case 500 ..< 599:
                    return .failure(.init(.badServerResponse))
                default:
                    return .failure(.init(.unknown))
                }
            }
            .asSingle()
    }
}
