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
    var hasBeenAdded: Bool
    var hasBeenTaken: Bool
    
    init(withName name: String, withHasBeenAdded hasBeenAdded: Bool = false, withHasBeenTaken hasBeenTaken: Bool = false) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
        self.hasBeenTaken = hasBeenTaken
    }
}
