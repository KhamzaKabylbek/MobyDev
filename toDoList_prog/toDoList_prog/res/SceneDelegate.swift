//
//  SceneDelegate.swift
//  toDoList_prog
//
//  Created by Хамза Кабылбек on 04.09.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let tabBarController = UITabBarControllerViewController()
        self.window = UIWindow(windowScene: scene)
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }
}


    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }




