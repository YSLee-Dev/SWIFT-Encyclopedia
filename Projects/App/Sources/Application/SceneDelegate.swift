//
//  SceneDelegate.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/7/23.
//

import UIKit

import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var container: Container?
    var appCoordinator: AppCoordinator?
  
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        self.container = Container()
        
        [
            MainAssembly(),
            DomainAssembly(),
            DataAssembly()
        ].forEach { [weak self] con in
            let assembly = con as? Assembly
            assembly!.assemble(container: self!.container!)
        }

        self.appCoordinator = AppCoordinator(
            dependency: .init(container: self.container!, navigationController: navigationController)
        )
        self.appCoordinator!.start()
    }
}
