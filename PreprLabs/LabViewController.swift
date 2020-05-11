//
//  LabViewController.swift
//  PreprLabs
//
//  Created by Sagar Bhatt on 2020-05-10.
//  Copyright © 2020 Sagar Bhatt. All rights reserved.
//

import UIKit
import os.log

class LabViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var nameEnter: UITextField!
    @IBOutlet weak var dateEnter: UITextField!
    @IBOutlet weak var locEnter: UITextField!
    @IBOutlet weak var descrEnter: UITextView!
    @IBOutlet weak var saveEnter: UIBarButtonItem!
    
    var lab: Lab?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameEnter.delegate = self
        
        if let lab = lab {
            navigationItem.title = lab.name
            nameEnter.text = lab.name
            dateEnter.text = lab.date
            locEnter.text = lab.location
        }
        
//        updateSaveButtonState()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    @IBAction func saveEnter(_ sender: Any) {
    }
    
    //MARK: Navigation
    @IBAction func cancelEnter(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveEnter else {
            os_log("Save not enter, cancel", log: OSLog.default, type: .debug)
            return
        }
        let name = nameEnter.text ?? ""
        let location = locEnter.text ?? ""
        let date = dateEnter.text ?? ""
        lab = Lab(name: name, date: date, location: location)
//        if(!(name=="" || location=="" || date=="")) {
//
//        } else {
//            let alert = UIAlertController(title: "Invalid entries", message: "Please ensure that you have entered something for each field.", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
    }
    
//    private func updateSaveButtonState() {
//        let name = nameEnter.text ?? ""
//        let location = locEnter.text ?? ""
//        let date = dateEnter.text ?? ""
//        saveEnter.isEnabled = (!name.isEmpty && !date.isEmpty && !location.isEmpty)
//    }
    
    
}
