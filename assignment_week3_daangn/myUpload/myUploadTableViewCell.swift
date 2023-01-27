//
//  myUploadTableViewCell.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/07.
//

import UIKit

class myUploadTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!

    @IBOutlet weak var imageViewPicked: UIImageView?
    
    var menuButton: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tappedBtn(_ sender: Any) {
        menuButton?()
    }
    
    
}

