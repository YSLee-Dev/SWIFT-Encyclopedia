//
//  AppCoordinator.swift
//  SWIFT-Encyclopedia
//
//  Created by 이윤수 on 11/13/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import UIKit

import Swinject

import Common
import Main

class AppCoordinator: CoordinatorProtocol {
    public struct Dependency {
        let container: Container
        let navigationController: UINavigationController
        
        public init(
            container: Container,
            navigationController: UINavigationController
        ) {
            self.container = container
            self.navigationController = navigationController
        }
    }
    
    public let dependency: Dependency
    public var navigationController: UINavigationController
    
    public var childCoordinator: [CoordinatorProtocol] = []
    
    public init(
        dependency: Dependency
    ) {
        self.dependency = dependency
        self.navigationController = dependency.navigationController
    }
    
    public func start() {
        let mainVC = dependency.container.resolve(MainVC.self)!
        let mainCoordinator = MainCoordinator(dependency: MainCoordinator
            .Dependency(
                mainVC: mainVC,
                navigationController: self.navigationController,
                container: self.dependency.container
            )
        )
        mainCoordinator.start()
        
        self.childCoordinator.append(mainCoordinator)
    }
}
