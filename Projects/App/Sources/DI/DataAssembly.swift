//
//  DataAssembly.swift
//  SWIFT-Encyclopedia
//
//  Created by 이윤수 on 11/16/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import Data
import Domain

import Swinject

public struct DataAssembly: Assembly {
    public func assemble(container: Swinject.Container) {
        container.register(MainEncyclopediaRepositoryProtocol.self) { _ in
            MainEncyclopediaRepository()
        }
    }
}
