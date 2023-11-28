//
//  CoordinatorProtocol.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/13/23.
//

import UIKit

public protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinator: [CoordinatorProtocol] { get set }
    func start()
}
