//
//  MedicationViewController.swift
//  MedicationTracker
//
//  Created by patelpra on 10/19/19.
//  Copyright © 2019 Crus Technologies. All rights reserved.
//

import UIKit

class MedicationDetailViewController: UIViewController {
    
    @IBOutlet weak var medicationLabel: UITextField!
    @IBOutlet weak var dateLabel: UITextField!
    
    var medicationController: MedicationController?
    var medication: MedicationItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Navigation
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let _ = self.medicationLabel.text,
            let  _ = self.dateLabel.text else { return }
        if let medication = self.medication {
            self.medicationController?.updateHasBeenTaken(for: medication)
        }
    }
}
