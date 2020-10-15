//
//  ReminderDescriptionViewController.swift
//  Reminder
//
//  Created by Mansi on 05/09/20.
//

import UIKit

class ReminderDescriptionViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    var info : NotificationInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = info?.title
        lblDescription.text = info?.subTitle
        if let time = info?.time{
            lblTime.text = Utility.getDateFormatter().string(from: time)
        }
     
    }
    class func newInstance() -> ReminderDescriptionViewController{
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "ReminderDescriptionViewController") as! ReminderDescriptionViewController
    }
    

}
