//
//  CreateNewTableViewCell.swift
//  Reminder
//
//  Created by Mansi on 30/08/20.
//

import UIKit

protocol CreateNewTableViewCellDelegate {
    func createNewPressed(id: Int)
}

class CreateNewTableViewCell: UITableViewCell {
    var delegate:CreateNewTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var btnCreateNew: UIButton!
    
    @IBAction func createNewPressed(_ sender: Any) {
        if let _ = delegate{
            self.delegate?.createNewPressed(id: 0)
        }
        
    }
}
