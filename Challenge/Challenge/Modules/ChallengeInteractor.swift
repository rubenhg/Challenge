//
//  ChallengeInteractor.swift
//  Challenge
//
//  Created by Rubén Higuera Galán on 25/3/23.
//

import Foundation

class ChallengeInteractor: ChallengeInteractorProtocol{
    
    var presenter: ChallengePresenterProtocol?
    private let worker: ChallengeWorkerProtocol
    private var movement : [ChallengeModel]
    
    let movementsUrl = "https://code-challenge-e9f47.web.app/transactions.json"
    
    init(worker: ChallengeWorkerProtocol ){
            self.worker = worker
            self.movement = []
        }
    
    func getMovements() {
        worker.getMovements(url: movementsUrl) { result in
            switch result {
            case .success(let response):
                var movements = try? JSONDecoder().decode([ChallengeModel].self, from: response)
                
                if self.movement.isEmpty{
                    self.movement = movements!
                    let filterMovements = movements?.filter { $0.checkDateValid(string: $0.date ?? "") }
                    let shortedMovements = filterMovements?.sorted(by: {
                        $0.date?.compare($1.date ?? "") == .orderedDescending
                    })
                    self.presenter?.show(movements: shortedMovements!)
                } else {
                    self.movement.append(contentsOf: movements!)
                    self.presenter?.show(movements: self.movement)
                }
            case .failure(let error):
                self.presenter?.showError(title: "Se ha producido un error", text: error.localizedDescription)
                
            }
        }
    }
}

