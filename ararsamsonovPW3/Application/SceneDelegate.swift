//
//  SceneDelegate.swift
//  ararsamsonovPW3
//
//  Created by Артём on 08.11.2024.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Properties
    var window: UIWindow?
    
    // MARK: - Scene Lifecycle Methods
    final func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController(rootViewController: WishMakerViewController())
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
    }
}
