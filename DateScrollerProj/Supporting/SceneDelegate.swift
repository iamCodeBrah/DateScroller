//
//  SceneDelegate.swift
//  DateScrollerProj
//
//  Created by YouTube on 2023-03-16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: ViewController())
        self.window = window
        self.window?.makeKeyAndVisible()
    }

}

