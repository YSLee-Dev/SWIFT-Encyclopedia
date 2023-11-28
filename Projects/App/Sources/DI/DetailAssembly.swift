//
//  DetailAssembly.swift
//  SWIFT-Encyclopedia
//
//  Created by 이윤수 on 11/28/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import Detail
import Domain

import Swinject

public struct DetailAssembly: Assembly {
    public func assemble(container: Swinject.Container) {
        container.register(DetailViewModel.self) { _ in
            DetailViewModel()
        }
        container.register(DetailSwiftUIView.self) { container in
            DetailSwiftUIView(viewModel: container.resolve(DetailViewModel.self)!)
        }
    }
}
