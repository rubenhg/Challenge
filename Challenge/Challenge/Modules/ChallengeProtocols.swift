//
//  ChallengeProtocols.swift
//  Challenge
//
//  Created by Rubén Higuera Galán on 25/3/23.
//

import Foundation
import UIKit


protocol ChallengeViewProtocol{
    func show(movements: [ChallengeModel])
    func showError(title: String, text: String)
}

protocol ChallengePresenterProtocol{
    func loadData()
    func show(movements: [ChallengeModel])
    func showError(title: String, text: String)
}

protocol ChallengeInteractorProtocol {
    func getMovements()
}

protocol ChallengeWorkerProtocol{
    func getMovements(url: String , completion: @escaping(Result<Data, Error>) -> Void)
}

