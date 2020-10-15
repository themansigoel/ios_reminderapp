//
//  ReminderInfoTableViewCell.swift
//  Reminder
//
//  Created by Mansi on 04/09/20.
//

import UIKit

class ReminderInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(info : NotificationInfo){
        lblHeading.text = info.title
        lblTime.text = Utility.getDateFormatter().string(from: info.time)
    }

   
}
