//
//  SceneDelegate.swift
//  BaseProject
//
//  Created by taehy.k on 2021/07/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let sampleStoryboard = UIStoryboard(name: "SampleStoryboard", bundle: nil)
        guard let sampleScene = sampleStoryboard.instantiateViewController(identifier: "SampleViewController") as? SampleViewController else { return }
        
        window?.rootViewController = UINavigationController(rootViewController: sampleScene)
        window?.makeKeyAndVisible()
    }
}

