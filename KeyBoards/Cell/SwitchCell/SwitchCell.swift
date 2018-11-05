//
//  SwitchCell.swift
//  KeyBoards
//
//  Created by PABLO HERNANDEZ JIMENEZ on 17/10/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

protocol SwitchCellDelegate {
    func SwitchCellFunc(_ cell: SwitchCell, didChangedSwitchValue value: Bool)
}
class SwitchCell: UITableViewCell {

    @IBOutlet weak var lblSwitchCell: UILabel!
    @IBOutlet weak var SwitchCell: UISwitch!
    var delegate:SwitchCellDelegate!
    
    @IBAction func SwitchChanged(_ sender:Any){
        delegate.SwitchCellFunc(self, didChangedSwitchValue: self.SwitchCell.isOn)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

