//
//  LabTableViewController.swift
//  PreprLabs
//
//  Created by Sagar Bhatt on 2020-05-10.
//  Copyright © 2020 Sagar Bhatt. All rights reserved.
//

import UIKit
import os.log

class LabTableViewController: UITableViewController, OptionButtonsDelegate {
    
    var labs = [Lab]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleLabs()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LabTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LabTableViewCell else {
            fatalError("Dequeued cell is not an instance of LabTableViewCell")
        }
        
        let meal = labs[indexPath.row]
        
        cell.name.text = meal.name
        cell.date.text = meal.date
        cell.location.text = meal.location
        
        cell.delegate = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func closeFriendsTapped(at index: IndexPath) {
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
            case "AddLab":
                os_log("Adding new lab.", log: OSLog.default, type: .debug)
            case "ShowDetail":
                guard let labDetailViewController = segue.destination as? LabViewController else {
                    fatalError("Unexpected destination: \(segue.destination)")
                }
                 
                guard let selectedLabCell = sender as? LabTableViewCell else {
                    fatalError("Unexpected sender: \(sender)")
                }
                 
                guard let indexPath = tableView.indexPath(for: selectedLabCell) else {
                    fatalError("The selected cell is not being displayed by the table")
                }
                 
                let selectedLab = labs[indexPath.row]
                labDetailViewController.lab = selectedLab
            default:
                fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
        

    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? LabViewController, let lab = sourceViewController.lab {
            let newIndexPath = IndexPath(row: labs.count, section: 0)
            labs.append(lab)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    private func loadSampleLabs() {
guard let lab1 = Lab(name: "BioInf lab", date: "June 26, 2019", location: "Ontario Science Centre") else { fatalError("Cannot instantiate this lab") }
        guard let lab2 = Lab(name: "Python lab", date: "November 23, 2019", location: "Oakville Place") else { fatalError("Cannot instantiate this lab") }
        guard let lab3 = Lab(name: "iOS lab", date: "January 28, 2020", location: "University of Kentucky") else { fatalError("Cannot instantiate this lab") }
        labs += [lab1, lab2, lab3]
    }
}
