//
//  SceneDelegate.swift
//  Challenge
//
//  Created by Rubén Higuera Galán on 25/3/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate{
    var window: UIWindow?
    var challengeRouter = ChallengeRouter()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {return}
        
        window = UIWindow(windowScene: windowScene)
        challengeRouter.buildChallenge(window: window)
    }
}
