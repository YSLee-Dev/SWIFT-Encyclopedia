//
//  NetworkTests.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/7/23.
//

import Foundation

@testable import Data

import RxSwift
import RxBlocking
import XCTest
import Nimble

class NetworkServiceTests: XCTestCase {
    var networkService: NetworkServiceProtocol!
    override func setUp() {
        self.networkService = NetworkService()
    }
    
    // 통신 검증
    func testRequest() {
        // GIVEN
        let query = "주식"
        
        var url = URLComponents()
        url.scheme = NetworkConfiguration.URL.scheme.rawValue
        url.host = NetworkConfiguration.URL.host.rawValue
        url.path = NetworkConfiguration.URL.path.rawValue
        url.queryItems = [
            URLQueryItem(name: NetworkConfiguration.Query.start.rawValue, value: "1"),
            URLQueryItem(name: NetworkConfiguration.Query.query.rawValue, value: query),
            URLQueryItem(name: NetworkConfiguration.Query.display.rawValue, value: "10")
        ]
        
        // WHEN
        let requestData = self.networkService.request(
            url: url,
            decodingType: EncyclopediaDataDTO.self,
            method: URLSessionMethod.GET
        )
        let data = requestData.map { data -> EncyclopediaDataDTO? in
            guard case .success(let value) = data else {return nil}
            return value
        }
        let arrayData = data.asObservable().toBlocking()
        let blocking = try? arrayData.toArray()
        
        // THEN
        let requestTitle = blocking!.first!!.items.first!.title
        let requestStart = blocking!.first!!.start
        
        let titleAnswer = "<b>주식</b>"
        let startAnswer = 1
        
        expect(requestTitle).to(
            equal(titleAnswer),
            description: "타이틀은 동일해야함"
            )
        
        expect(requestStart).to(
            equal(startAnswer),
            description: "시작 값은 1부터 시작해야함"
            )
    }
}
