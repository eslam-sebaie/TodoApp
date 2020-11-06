//
//  TodoVCTableViewCell.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/30/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit
protocol showTrashDelegate: AnyObject {
    func btnTrashTapped(cell: TodoVCTableViewCell)
}
class TodoVCTableViewCell: UITableViewCell {

    @IBOutlet weak var todoImage: UIImageView!
    @IBOutlet weak var todaLabel: UILabel!
    @IBOutlet weak var todoDesign: UIButton!
    
    var delegate: showTrashDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func todoPressed(_ sender: Any) {
        delegate?.btnTrashTapped(cell: self)
    }
    

}
