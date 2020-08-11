//
//  ExerciseHeaderFooter.swift
//  flab2ab
//
//  Created by Tyler Linquata on 8/8/20.
//  Copyright © 2020 Tyler Linquata. All rights reserved.
//

import UIKit

class ExerciseHeader: UITableViewHeaderFooterView {

    let title = UILabel()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureContents() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            // Center the label vertically, and use it to fill the remaining
            // space in the header view.
            title.heightAnchor.constraint(equalToConstant: 30),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

}
