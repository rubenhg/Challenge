//
//  ChallengePresenter.swift
//  Challenge
//
//  Created by Rubén Higuera Galán on 25/3/23.
//

import Foundation

class ChallengePresenter: ChallengePresenterProtocol{
    
    var ui: ChallengeViewController?
    private let challengeInteractor: ChallengeInteractor
        
    init(challengeInteractor: ChallengeInteractor){
            self.challengeInteractor = challengeInteractor
            
        }
    func loadData(){
        challengeInteractor.getMovements()
    }
    
    func show(movements: [ChallengeModel]){
        ui?.show(movements: movements)
    }
    func showError(title: String, text: String){
        ui?.showError(title: title, text: text)
    }
}

