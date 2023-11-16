//
//  DomainAssembly.swift
//  SWIFT-Encyclopedia
//
//  Created by 이윤수 on 11/16/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import Domain

import Swinject

public struct DomainAssembly: Assembly {
    public func assemble(container: Swinject.Container) {
        container.register(MainEncyclopediaUsecaseProtocol.self) { container in
            MainEncyclopediaUsecase(repository: container.resolve(MainEncyclopediaRepositoryProtocol.self)!)
        }
    }
}
