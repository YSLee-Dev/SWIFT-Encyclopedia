//
//  MainCoordinator.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/13/23.
//

import UIKit
import Common

public class MainCoordinator: CoordinatorProtocol {
    public struct Dependency {
        let mainVC: MainVC
        let navigationController: UINavigationController
        
        public init(
            mainVC: MainVC,
            navigationController: UINavigationController
        ) {
            self.mainVC = mainVC
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
        self.navigationController.pushViewController(self.dependency.mainVC, animated: true)
    }
}
