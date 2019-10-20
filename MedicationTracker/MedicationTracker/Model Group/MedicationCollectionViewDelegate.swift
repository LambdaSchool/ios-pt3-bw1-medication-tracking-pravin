//
//  MedicationCollectionViewDelegate.swift
//  MedicationTracker
//
//  Created by patelpra on 10/20/19.
//  Copyright © 2019 Crus Technologies. All rights reserved.
//

import Foundation

protocol MedicationItemCollectionViewCellDelegate: class {
    func toggleHasBeenTaken(for cell: MedicationItemCollectionViewCell)
}
