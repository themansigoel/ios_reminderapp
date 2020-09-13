//
//  CreateNewReminderViewController.swift
//  Reminder
//
//  Created by RAHUL GOEL on 02/09/20.
//

import UIKit

class CreateNewReminderViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var btnSelectTime: UIButton!
    @IBOutlet weak var datePicker: ScheduleTimePicker!
    
    let notifmanager = LocalNotificationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    class func newInstance()->CreateNewReminderViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "CreateNewReminderViewController") as! CreateNewReminderViewController
    }
    
    func scheduleNotification(){
        notifmanager.getUserPermissionForNotification(completion: {[weak self]
            (success, error) in
            if success{
                if let title = self?.txtTitle.text, let description = self?.txtDescription.text{
                    self?.notifmanager.setNotfication(title: title, desc: description, time: 1)
                    
                }
            }
        })
    }
    
    @IBAction func selectTimePressed(_ sender: Any) {
    }
    
    @IBAction func createReminder(_ sender: Any) {
        validateData()
    }
    
    
    @IBAction func dateChanged(_ sender: Any) {

    }
    
}

extension CreateNewReminderViewController{
    func validateData(){
          //Title should not be empty
        if (txtTitle.text?.isEmpty ?? true){
            showAlert(message: "Please Enter title", title: "Required")
        }
        //Desc should not be empty
        else if (txtDescription.text?.isEmpty ?? true){
                   showAlert(message: "Please Enter description", title: "Required")
               }
        //Time should be set
        else if (btnSelectTime.titleLabel?.text == "Select Time"){
            showAlert(message: "Please Enter Valid Time", title: "Required")
        }else{
            //All Validation done create Reminder
            scheduleNotification()
        }
    }
    
    func showErrorValidationAlert(str:String){
        
    }
    func showAlert(message:String, title:String){
        let  alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

}
