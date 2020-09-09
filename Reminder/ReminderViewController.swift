//
//  ViewController.swift
//  Reminder
//
//  Created by RAHUL GOEL on 22/08/20.
//

import UIKit

class ReminderViewController: UIViewController, CreateNewTableViewCellDelegate {
    func createNewPressed(id: Int) {
        let vc = CreateNewReminderViewController.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBOutlet weak var tblview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension ReminderViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CreateNewCell", for: indexPath) as? CreateNewTableViewCell{
            cell.delegate = self
            return cell
        }
        }
        else if indexPath.section == 1{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderInfoCell", for: indexPath) as? ReminderInfoTableViewCell{
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            self.navigationController?.pushViewController(ReminderDescriptionViewController.newInstance(), animated: true)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
         return 100
        }
        return 120
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TableViewHeaderView.newInstance()
        if section == 0{
            view.configure(title: "Create Reminder")
        }else{
            view.configure(title: "My Reminders")
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}

