//
//  MedicationItemCollectionViewCell.swift
//  MedicationTracker
//
//  Created by patelpra on 10/20/19.
//  Copyright © 2019 Crus Technologies. All rights reserved.
//

import UIKit

class MedicationItemCollectionViewCell: UICollectionViewCell {
    
    var medicationItem: MedicationItem? {
        didSet {
            self.updateViews()
        }
    }
    
    @IBOutlet var hasBeenTaken: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    weak var delegate: MedicationItemCollectionViewCellDelegate?
    
    @IBAction func medicationItemTapped(_ sender: UIButton) {
        delegate?.toggleHasBeenTaken(for: self)
    }
    
    private func updateViews() {
        guard let medicationItem = self.medicationItem else { return }
        
        self.nameLabel.text = medicationItem.name
        self.imageView.image = UIImage(named: medicationItem.name)
        self.hasBeenTaken.text = medicationItem.hasBeenTaken ? "Taken" : "Not Taken"
    }
    
}
