//
//  Lab.swift
//  PreprLabs
//
//  Created by Sagar Bhatt on 2020-05-10.
//  Copyright © 2020 Sagar Bhatt. All rights reserved.
//

import UIKit

class Lab {
    var name: String
    var date: String
    var location: String
    
    init?(name: String, date: String, location: String) {
        guard !name.isEmpty && !date.isEmpty && !location.isEmpty else {
            return nil
        }
        self.name = name
        self.date = date
        self.location = location
    }
}
