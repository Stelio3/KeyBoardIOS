//
//  IconCell.swift
//  KeyBoards
//
//  Created by PABLO HERNANDEZ JIMENEZ on 24/10/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class IconCell: UITableViewCell {

    @IBOutlet weak var lblIconCell: UILabel!
    @IBOutlet weak var lblIconCellHint: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
