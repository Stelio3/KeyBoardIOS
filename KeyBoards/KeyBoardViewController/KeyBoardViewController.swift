//
//  KeyBoardViewController.swift
//  KeyBoards
//
//  Created by PABLO HERNANDEZ JIMENEZ on 17/10/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class KeyBoardViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    internal var options1: [Options] = []
    internal var options2: [Options] = []
    internal var options3: [Options] = []
    internal var options4: [Options] = []
    
    convenience init(options: [Options]) {
        self.init()
        self.options1 = options
        self.options2 = options
        self.options3 = options
        self.options4 = options
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "KeyBoards"
        loadAllOptions()
        registerCells()
        setupBarButtonsItem()

        // Do any additional setup after loading the view.
    }
    private func registerCells(){
        let identifier = "SwitchCell"
        let cellNib = UINib(nibName: identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: identifier)
        let identifierI = "IconCell"
        let cellNibI = UINib(nibName: identifierI, bundle: nil)
        tableView.register(cellNibI, forCellReuseIdentifier: identifierI)
    }
    private func setupBarButtonsItem(){
        let cancelBarButton = UIBarButtonItem(title: "General", style: .plain, target: self, action: nil)
        navigationItem.setLeftBarButton(cancelBarButton, animated: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func loadAllOptions(){
        let firstS1 = Options(title: "Keyboards")
        let secondS1 = Options(title: "Hardware Keyboard")
        
        let firstS2 = Options(title: "Text Replacement")
        let secondS2 = Options(title: "One Handed Keyboard")
        
        let firstS3 = Options(title: "Auto-Capitalization")
        let secondS3 = Options(title: "Auto-Correction")
        let thirdS3 = Options(title: "Check Spelling")
        let fourthS3 = Options(title: "Enable Caps Lock")
        let fifthS3 = Options(title: "Predictive")
        let sixthS3 = Options(title: "Smart Puntuation")
        let seventhS3 = Options(title: "Character Preview")
        let eighthS3 = Options(title: "Shortcut")
        
        let firstS4 = Options(title: "Enable Dictation")
        
        options1.append(firstS1)
        options1.append(secondS1)
        options2.append(firstS2)
        options2.append(secondS2)
        options3.append(firstS3)
        options3.append(secondS3)
        options3.append(thirdS3)
        options3.append(fourthS3)
        options3.append(fifthS3)
        options3.append(sixthS3)
        options3.append(seventhS3)
        options3.append(eighthS3)
        options4.append(firstS4)
    }
}
extension KeyBoardViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        if section == 0 {
            return options1.count
        }else if section == 1{
            return options2.count
        }else if section == 2{
            return options3.count
        }else{
            return options4.count
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 2{
            return "ALL KEYBOARDS"
        }
        else if section == 3{
            return "DICTATION"
        }
        else{
            return ""
        }
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 2{
            return "Double tapping the space bar will insert a period followed by a space."
        }
        else{
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 2{
            let cell: SwitchCell = (tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell)!
            let cellRow = options3[indexPath.row]
            cell.lblSwitchCell.text = cellRow.title
            cell.SwitchCell.isOn = true
            cell.delegate = self
            return cell
        }
        if indexPath.section == 3{
            let cell: SwitchCell = (tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell)!
            let cellRow = options4[indexPath.row]
            cell.lblSwitchCell.text = cellRow.title
            cell.SwitchCell.isOn = false
            cell.delegate = self
            return cell
        }
        if indexPath.section == 0{
            let cell: IconCell = (tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath) as? IconCell)!
            let cellRow = options1[indexPath.row]
            cell.lblIconCell.text = cellRow.title
            if indexPath.row == 0{
                cell.lblIconCellHint.text = "3"
            } else{
                cell.lblIconCellHint.text = ""
            }
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        else{
            let cell: IconCell = (tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath) as? IconCell)!
            let cellRow = options2[indexPath.row]
            cell.lblIconCell.text = cellRow.title
            if indexPath.row == 1{
                cell.lblIconCellHint.text = "Off"
            }
            else{
                cell.lblIconCellHint.text = ""
            }
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return (options3.count > 0)
    }
}
extension KeyBoardViewController: SwitchCellDelegate{
    func SwitchCellFunc(_ cell: SwitchCell, didChangedSwitchValue value: Bool) {
        print(value)
    }
}
