//
//  ChallengeTableViewCell.swift
//  Challenge
//
//  Created by Rubén Higuera Galán on 25/3/23.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {


    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var decriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyles()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setStyles(){
        dataView.layer.cornerRadius = 23
        dataView.layer.borderWidth = 1
        dataView.layer.borderColor = UIColor.black.cgColor
    }
    
    func dateFormat(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let formattedDate = dateFormatter.date(from: date) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.timeStyle = .none
            dateFormatter.dateStyle = .medium
            dateFormatter.locale = Locale(identifier: "es")
            return dateFormatter.string(from: formattedDate)
        }
        return date
    }
    

    func setValueColor(amount: Double) {
        amountLabel.text = "\(String(amount))€"
        amountLabel.textColor = amount  >= 0 ? UIColor.systemGreen : UIColor.red
    }
    
    func setData(model: ChallengeModel){
        var totalAmount = model.amount
        if let fee = model.fee {
                   totalAmount = model.amount + fee
               }
        dateLabel.text = dateFormat(date: model.date ?? "")
        setValueColor(amount: totalAmount)
        decriptionLabel.text = model.description
    }
}
