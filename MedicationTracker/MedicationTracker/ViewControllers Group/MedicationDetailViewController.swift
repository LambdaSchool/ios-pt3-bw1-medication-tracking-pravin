//
//  MedicationViewController.swift
//  MedicationTracker
//
//  Created by patelpra on 10/19/19.
//  Copyright © 2019 Crus Technologies. All rights reserved.
//

import UIKit

class MedicationDetailViewController: UIViewController {
    
    @IBOutlet weak var medicationTextField: UITextField!
    @IBOutlet weak var trackMedicine: UITextView!
    
    var medicationController: MedicationController?
    var medication: MedicationItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Navigation
    
    func updateViews() {
        if let medication = self.medication {
            self.medicationTextField.text = medication.name
            self.trackMedicine.text = medication.trackMedicine
            title = medication.name
        } else {
            self.title = "Medication Tracked"
        }
    }
    
    @IBAction func dateControl(_ sender: Any) {
        guard let _ = self.medicationTextField.text,
            let _ = self.trackMedicine.text else { return }
        
            navigationController?.popViewController(animated: true)
    }    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let _ = self.medicationTextField.text,
            let _ = self.trackMedicine else { return }
        if let medication = self.medication {
            self.medicationController?.updateHasBeenTaken(for: medication)
        }
    }
}
