//
//  CustomTableViewCell.swift
//  SpartanClub
//
//  Created by Tan  Manh on 4/7/19.
//  Copyright © 2019 Group 2. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var MessageBackGround: UIView!
    @IBOutlet weak var senderUserName: UILabel!
    @IBOutlet weak var avaImage: UIImageView!
    @IBOutlet weak var MessageInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
