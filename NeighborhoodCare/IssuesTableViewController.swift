//
//  IssuesTableViewController.swift
//  NeighborhoodCare
//
//  Created by Juliano Costa Silva on 02/08/22.
//

import UIKit
import CoreData

class IssuesTableViewController: UITableViewController {
    var fetchedResultsController: NSFetchedResultsController<Issue>!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadIssues()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let issueViewController = segue.destination as? IssueViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            issueViewController.issue = fetchedResultsController.object(at: indexPath)
        }
    }

    func loadIssues() {
        let fetchRequest: NSFetchRequest<Issue> = Issue.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)

        fetchedResultsController.delegate = self
        try? fetchedResultsController.performFetch()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? IssueTableViewCell else {
            return UITableViewCell()
        }

        let issue = fetchedResultsController.object(at: indexPath)
        cell.configureWith(issue)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let issue = fetchedResultsController.object(at: indexPath)
            context.delete(issue)
            try? context.save()
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension IssuesTableViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        tableView.reloadData()
    }
}
