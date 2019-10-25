//
//  MedicationController.swift
//  MedicationTracker
//
//  Created by patelpra on 10/17/19.
//  Copyright © 2019 Crus Technologies. All rights reserved.
//

import Foundation

class MedicationController {
    
    init() {
//        if self.medicationItemsPreference == false {
//            self.setMedicationItems()
//        } else {
            self.loadFromPersistent()
//        }
//
//        // test code
//        setMedicationItems()
//        print(medicationItems.count)
//
        
        
    }
    
    
    // MARK: - Variables
    
    private (set) var medicationItems: [MedicationItem] = []
    let medicationPreferenceKey = "medicationPreferenceKey"
    
    
    var medicatonItemsTaken: [MedicationItem] {
        return self.medicationItems.filter { $0.hasBeenTaken == true }
    }
    
    var medicationItemNotTaken: [MedicationItem] {
        return self.medicationItems.filter { $0.hasBeenTaken == false }
    }
    
    var medicationItemsPreference: Bool? {
        return UserDefaults.standard.bool(forKey: medicationPreferenceKey)
    }
    
    private var medicationFileURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documentsDirectory.appendingPathComponent("medication.plist")
    }
    
    
    // MARK: - Methods
    
    func createMedicationItem(withName name: String) {
        let medicationItem = MedicationItem(named: name, trackMedicine: " ")
        medicationItems.append(medicationItem)
    }
    
    func updateHasBeenTaken(for item: MedicationItem) {
        guard let index = medicationItems.firstIndex(of: item) else { return }
        medicationItems[index].hasBeenTaken = !medicationItems[index].hasBeenTaken
    }
    
    private func setMedicationItems() {
        let itemNames = ["Amoxicillin", "Zocor", "Multi-Vitamin", "Qnoul-COQ10", "Bayer Asprin", "Alegra-D"]
        for name in itemNames {
            createMedicationItem(withName: name)
        }
        
        saveToPersistent()
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: medicationPreferenceKey)
        
    }
    
    // MARK: - Persistence
    
    func saveToPersistent() {
        guard let url = self.medicationFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let medicationItemData = try encoder.encode(self.medicationItems)
            try medicationItemData.write(to: url)
        } catch {
            NSLog("Error saving medicationItems data: \(error)")
        }
    }
    
    func loadFromPersistent() {
        let fileManager = FileManager.default
        guard let url = self.medicationFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let medicationItemData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            self.medicationItems = try decoder.decode([MedicationItem].self, from: medicationItemData)
        } catch {
            NSLog("Error loading medicationItems data: \(error)")
        }
    }
}
