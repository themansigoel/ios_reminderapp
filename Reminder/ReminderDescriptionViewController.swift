//
//  ReminderDescriptionViewController.swift
//  Reminder
//
//  Created by RAHUL GOEL on 05/09/20.
//

import UIKit

class ReminderDescriptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    class func newInstance() -> ReminderDescriptionViewController{
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "ReminderDescriptionViewController") as! ReminderDescriptionViewController
    }

  

}
