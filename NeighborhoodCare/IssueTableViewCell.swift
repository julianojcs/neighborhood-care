//
//  IssueTableViewCell.swift
//  NeighborhoodCare
//
//  Created by Juliano Costa Silva on 02/08/22.
//

import UIKit

class IssueTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureWith (_ issue: Issue) {
        labelName?.text = issue.name
        labelDate?.text = "\(issue.date!.formatted())"
    }
}
