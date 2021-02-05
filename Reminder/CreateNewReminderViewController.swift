//
//  CreateNewReminderViewController.swift
//  Reminder
//
//  Created by Mansi on 02/09/20.
//

import UIKit

class CreateNewReminderViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var btnSelectTime: UIButton!
    @IBOutlet weak var datePicker: ScheduleTimePicker!
    
    @IBAction func btnCreatePressed(_ sender: Any) {
        datePicker.isHidden = true
        showAlert(message: "Your reminder is saved", title: "Done")
    }
    let notifmanager = LocalNotificationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        addTapGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtTitle.becomeFirstResponder()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      //  txtTitle.becomeFirstResponder()
    }
    

    
    func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
    }
    @objc func dismiss(recognizer: UITapGestureRecognizer){
        txtTitle.resignFirstResponder()
        txtDescription.resignFirstResponder()
    }
    
    class func newInstance()->CreateNewReminderViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "CreateNewReminderViewController") as! CreateNewReminderViewController
    }
    
    func scheduleNotification(){
        notifmanager.getUserPermissionForNotification(completion: {[weak self]
            (success, error) in
            if success{
                if let title = self?.txtTitle.text, let description = self?.txtDescription.text, let time = self?.datePicker.date{
                    self?.notifmanager.setNotfication(title: title, desc: description, time: time)
                }
            }
        })
    }
    
    
    @IBAction func selectTimePressed(_ sender: Any) {
        datePicker.isHidden = false
    }
    
    @IBAction func createReminder(_ sender: Any) {
        validateData()
    }
    
    
    @IBAction func dateChanged(_ sender: Any) {
        
        let dateString = Utility.getDateFormatter().string(from: datePicker.date)
        btnSelectTime.setTitle(dateString, for: .normal)
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
        }
    else{
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

extension CreateNewReminderViewController : UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        /*if textField.tag == 100{ //Title
            datePicker.isHidden = true
        }else if textField.tag == 200{// Desc
            datePicker.isHidden = true
        }*/
        
        datePicker.isHidden = true
    }
}

