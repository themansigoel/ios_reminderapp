//
//  CreateNewReminderViewController.swift
//  Reminder
//
//  Created by RAHUL GOEL on 02/09/20.
//

import UIKit

class CreateNewReminderViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var btnSelectTime: UIButton!
    
    @IBAction func selectTimePressed(_ sender: Any) {
    }
    
    
    @IBAction func createReminder(_ sender: Any) {
    }
    
    
    let notifmanager = LocalNotificationManager()

    @IBOutlet weak var txtDescription: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleNotification()
    }
    
    class func newInstance()->CreateNewReminderViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "CreateNewReminderViewController") as! CreateNewReminderViewController
    }
    
    func scheduleNotification(){
        notifmanager.getUserPermissionForNotification()
    }
    

}
