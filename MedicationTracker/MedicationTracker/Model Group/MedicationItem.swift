//
//  MedicationItem.swift
//  MedicationTracker
//
//  Created by patelpra on 10/17/19.
//  Copyright © 2019 Crus Technologies. All rights reserved.
//

import Foundation

struct MedicationItem: Equatable, Codable {
    var name: String
    var trackMedicine: String
    var hasBeenTaken: Bool
   // var weekday: String
    
    
    init(named name: String, trackMedicine: String, hasBeenTaken: Bool = false) { // weekday
        self.name = name
        self.hasBeenTaken = hasBeenTaken
        self.trackMedicine = trackMedicine
    }
}
