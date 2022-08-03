//
//  IssueViewController.swift
//  NeighborhoodCare
//
//  Created by Juliano Costa Silva on 02/08/22.
//

import UIKit

class IssueViewController: UIViewController {

    @IBOutlet weak var imageViewIssue: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelDescription: UITextView!
    @IBOutlet weak var labelDate: UILabel!
    
    var issue: Issue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareScreen()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let issueFormViewController = segue.destination as? IssueFormViewController {
            issueFormViewController.issue = issue
        }
    }
    
    func prepareScreen() {
        if let issue = issue {
            if let image = issue.image {
                imageViewIssue.image = UIImage(data: image)
            }
            labelName.text = issue.name
            labelLocation.text = issue.location
            labelDescription.text = issue.desc
            labelDate.text = "\(issue.date!.formatted())"
        }
    }
}

