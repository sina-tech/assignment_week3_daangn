//
//  lifeTableViewCell.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/05.
//

import UIKit

class lifeTableViewCell: UITableViewCell {

    @IBOutlet weak var lifeLabel1: UILabel!
    @IBOutlet weak var lifeLabel2: UILabel!
    
    @IBOutlet weak var lifeImageView: UIImageView!
    @IBOutlet weak var lifeLabel3: UILabel!
    
    @IBOutlet weak var lifeLabel4: UILabel!
    
    @IBOutlet weak var lifeLabel5: UILabel!
    
    @IBOutlet weak var lifeLabel6: UILabel!
    
    @IBOutlet weak var lifeUiView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
