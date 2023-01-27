//
//  chatTableViewCell.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/06.
//

import UIKit

class chatTableViewCell: UITableViewCell {
    @IBOutlet weak var cImageView1: UIImageView!
    
    @IBOutlet weak var cImageView2: UIImageView!
    
    @IBOutlet weak var chatLabel1: UILabel!
    
    @IBOutlet weak var chatLabel2: UILabel!
    
    @IBOutlet weak var chatLabel3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
