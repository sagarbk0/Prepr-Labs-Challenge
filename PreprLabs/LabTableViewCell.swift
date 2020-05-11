//
//  LabTableViewCell.swift
//  PreprLabs
//
//  Created by Sagar Bhatt on 2020-05-10.
//  Copyright © 2020 Sagar Bhatt. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

protocol OptionButtonsDelegate{
    func closeFriendsTapped(at index:IndexPath)
}

class LabTableViewCell: UITableViewCell {
    var delegate:OptionButtonsDelegate!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var buttonMap: UIButton!
    var indexPath:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func openMap(_ sender: UIButton) {
        let loc = self.location.text ?? ""
        (UIApplication.shared.openURL(NSURL(string: "http://maps.apple.com/?address=\(loc)")! as URL))
    }
    
}
