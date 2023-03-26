//
//  ChallengeRouter.swift
//  Challenge
//
//  Created by Rubén Higuera Galán on 25/3/23.
//

import Foundation
import UIKit

class ChallengeRouter {
    func buildChallenge(window: UIWindow?){
        let view = ChallengeViewController()
        let worker = ChallengeWorker()
        let interactor = ChallengeInteractor(worker: worker)
        let presenter = ChallengePresenter(challengeInteractor : interactor)
       
        interactor.presenter = presenter
        presenter.ui = view
        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}

