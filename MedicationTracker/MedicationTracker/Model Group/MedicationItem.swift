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
    var hasBeenTaken: Bool
    
    
    init(name: String, hasBeenTaken: Bool = false) {
        self.name = name
        self.hasBeenTaken = hasBeenTaken
        }    
    }


