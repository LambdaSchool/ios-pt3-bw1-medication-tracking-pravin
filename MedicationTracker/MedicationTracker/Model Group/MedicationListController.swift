//
//  MedicationListController.swift
//  MedicationTracker
//
//  Created by patelpra on 10/17/19.
//  Copyright © 2019 Crus Technologies. All rights reserved.
//

import Foundation




// MARK: - Variables

private (set) var medicationItems: [MedicationItem] = []

// MARK: - Methods

func createMedicationItem(withName name: String) {
    let medicationItem = MedicationItem(withName: name)
    medicationItems.append(medicationItem)
}


func updateHasBeenAdded(for item: MedicationItem) {
    guard let index = medicationItems.firstIndex(of: item) else { return }
    medicationItems[index].hasBeenAdded = !medicationItems[index].hasBeenAdded
}

func updateHasBeenTaken(for item: MedicationItem) {
    guard let index = medicationItems.firstIndex(of: item) else { return }
    medicationItems[index].hasBeenTaken = !medicationItems[index].hasBeenTaken
}

private func setMedicationItems() {
    let itemNames = ["Tumeric", "Cinnamon", "Multi-Vitamin", "Qnoul-COQ10", "Bayer Asprin", "Alegra-D"]
    for name in itemNames {
        createMedicationItem(withName: name)
    }
}
