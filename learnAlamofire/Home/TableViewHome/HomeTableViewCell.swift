//
//  HomeTableViewCell.swift
//  learnAlamofire
//
//  Created by Muhammad Hammam on 27/12/2020.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageOutlet.layer.cornerRadius = 15
        
    }

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var ViewOutlet: UIView!
    @IBOutlet weak var lableOutlet: UILabel!
    
    @IBOutlet weak var itemsCountOutlet: UILabel!
    @IBOutlet weak var stepperOutlet: UIStepper!
    
    
    @IBAction func stepperOutlet(_ sender: UIStepper) {
        itemsCountOutlet.text = Int(sender.value).description
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        // Configure the view for the selected state
    }
    
}
