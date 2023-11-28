//
//  MainCoordinator.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/13/23.
//

import UIKit
import Common
import Domain
import Detail

import Swinject

public class MainCoordinator: CoordinatorProtocol {
    public struct Dependency {
        let mainVC: MainVC
        let navigationController: UINavigationController
        let container: Container
        
        public init(
            mainVC: MainVC,
            navigationController: UINavigationController,
            container: Container
        ) {
            self.mainVC = mainVC
            self.navigationController = navigationController
            self.container = container
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
        self.dependency.mainVC.viewModel.delegate = self
    }
}

extension MainCoordinator: MainVCAction {
    func tapEncyclopediaData(data: Domain.EncyclopediaData) {
        let coordinator = DetailCoordinator(dependency:
                .init(detailVC: self.dependency.container.resolve(DetailSwiftUIView.self)!, 
                      navigationController: self.navigationController,
                      tapEncyclopediaData: data)
        )
        coordinator.start()
        coordinator.delegate = self
        
        self.childCoordinator.append(coordinator)
    }
}

extension MainCoordinator: DetailCoordinatorDelegate {
    public func onDisappear(coordinator: Common.CoordinatorProtocol) {
        self.childCoordinator = self.childCoordinator.filter {
            $0 !== coordinator
        }
    }
}
