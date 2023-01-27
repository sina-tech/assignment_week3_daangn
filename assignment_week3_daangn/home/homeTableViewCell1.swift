//
//  homeTableViewCell1.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/05.
//

import UIKit

class homeTableViewCell1: UITableViewCell {

    @IBOutlet weak var uiImageView: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
