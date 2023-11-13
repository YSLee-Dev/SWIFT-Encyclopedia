//
//  MainAssembly.swift
//  SWIFT-Encyclopedia
//
//  Created by 이윤수 on 11/13/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import Main

import Swinject

public struct MainAssembly: Assembly {
    public func assemble(container: Swinject.Container) {
        container.register(MainViewModel.self) { _ in
            MainViewModel()
        }
        container.register(MainVC.self) { container in
            MainVC(viewModel: container.resolve(MainViewModel.self)!)
        }
    }
}
