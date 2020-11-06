//
//  ProfileTableViewCell.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/31/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileData: UILabel!
    @IBOutlet weak var profileView: UIView!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
