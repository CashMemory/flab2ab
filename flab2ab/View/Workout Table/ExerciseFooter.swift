//
//  ExerciseFooter.swift
//  flab2ab
//
//  Created by Tyler Linquata on 8/8/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class ExerciseFooter: UITableViewHeaderFooterView {

    let addSetButton = UIButton()
    let removeSetButton = UIButton()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureContents() {
        addSetButton.setTitle("Add Set", for: .normal)
        addSetButton.setTitleColor(.black, for: .normal)
        addSetButton.frame = CGRect(x: 200, y: 10, width: 150, height: 40)
        
        removeSetButton.setTitle("Remove Set", for: .normal)
        removeSetButton.setTitleColor(.red, for: .normal)
        removeSetButton.frame = CGRect(x: 20, y: 10, width: 150, height: 40)
        
        contentView.addSubview(addSetButton)
        contentView.addSubview(removeSetButton)
    }

}
