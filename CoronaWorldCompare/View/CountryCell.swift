//
//  CountryCell.swift
//  CoronaWorldCompare
//
//  Created by Bartu akman on 19.04.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var countryCaseLabel: UILabel!
    
    @IBOutlet weak var countryDeathLabel: UILabel!
    
    @IBOutlet weak var countryTestLabel: UILabel!
    
    
    func updateUI(cell: Country) {
        print(cell.countryName)
        
        countryNameLabel.text =  cell.countryName
        countryCaseLabel.text = "\(cell.countryCase)"
        countryDeathLabel.text = "\(cell.countryDeath)"
        countryTestLabel.text = "\(cell.countryTest)"

        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
