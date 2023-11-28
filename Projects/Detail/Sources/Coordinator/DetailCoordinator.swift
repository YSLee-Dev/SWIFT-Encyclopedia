//
//  DetailCoordinator.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/28/23.
//

import UIKit
import SwiftUI

import Common
import Domain

public class DetailCoordinator: CoordinatorProtocol {
    public struct Dependency {
        var detailVC: DetailSwiftUIView
        let navigationController: UINavigationController
        let tapEncyclopediaData: EncyclopediaData
        
        public init(
            detailVC: DetailSwiftUIView,
            navigationController: UINavigationController,
            tapEncyclopediaData: EncyclopediaData
        ) {
            self.detailVC = detailVC
            self.navigationController = navigationController
            self.tapEncyclopediaData = tapEncyclopediaData
        }
    }
    
    var dependency: Dependency
    public weak var delegate: DetailCoordinatorDelegate?
    public var childCoordinator: [Common.CoordinatorProtocol] = []
    public var navigationController: UINavigationController
    
    public init(
        dependency: Dependency
    ) {
        self.navigationController = dependency.navigationController
        self.dependency = dependency
    }
    
    deinit {
        print("Detail Coordinator DEINIT")
    }
    
    public func start() {
        self.dependency.detailVC.viewModel.tapEncyclopediaData = self.dependency.tapEncyclopediaData
        self.dependency.detailVC.delegate = self
        
        let swiftUIVC = UIHostingController(rootView: self.dependency.detailVC)
        self.navigationController.pushViewController(swiftUIVC, animated: true)
    }
}

extension DetailCoordinator: DetailAction {
    func onDisappear() {
        self.delegate?.onDisappear(coordinator: self)
    }
}
