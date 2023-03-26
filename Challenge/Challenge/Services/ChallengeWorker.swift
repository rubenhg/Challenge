//
//  ChallengeWorker.swift
//  Challenge
//
//  Created by Rubén Higuera Galán on 25/3/23.
//

import Foundation

final class ChallengeWorker: ChallengeWorkerProtocol{
    private let client = ServiceManager()
    
    func getMovements(url: String ,completion: @escaping (Result<Data, Error>) -> Void) {
        if let apiUrl = URL(string: url) {
            client.get(url: apiUrl) { result -> Void in
                completion(result)
            }
        }
    }
}
