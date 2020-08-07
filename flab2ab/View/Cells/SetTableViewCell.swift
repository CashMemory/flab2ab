//
//  SetTableViewCell.swift
//  flab2ab
//
//  Created by Tyler Linquata on 8/6/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class SetTableViewCell: UITableViewCell {
    
    @IBOutlet var myLabel: UILabel!
    
    static let identifier = "SetTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    public func configure(with model: Model) {
        self.myLabel.text = model.text
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
