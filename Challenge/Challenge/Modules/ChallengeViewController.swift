//
//  ChallengeViewController.swift
//  Challenge
//
//  Created by Rubén Higuera Galán on 25/3/23.
//

import UIKit

class ChallengeViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var movements: [ChallengeModel] = []
    var presenter: ChallengePresenterProtocol?
    
    init(){
        super.init(nibName: "Challenge", bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.loadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        titleLabel.text = "Challenge Accepted"
        
    }

    func registerCell(){
        tableView.register(UINib(nibName: "ChallengeTableViewCell", bundle: nil), forCellReuseIdentifier: "challengeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func show(movements: [ChallengeModel]){
        self.movements = movements
        DispatchQueue.main.sync{
            self.tableView.reloadData()
        }
    }
    
    func showError(title: String, text: String){
        let alert = UIAlertController(title: title, message: text, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
 
}

extension ChallengeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeTableViewCell") as! ChallengeTableViewCell
        
        let model = movements[indexPath.row]
        cell.setData(model: model)
        
        return cell
    }
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
