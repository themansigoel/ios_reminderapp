//
//  ViewController.swift
//  Reminder
//
//  Created by Mansi on 22/08/20.
//

import UIKit
import CoreLocation

class ReminderViewController: UIViewController, CreateNewTableViewCellDelegate {
    func createNewPressed(id: Int) {
        let vc = CreateNewReminderViewController.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var tblview: UITableView!
    
    var pendingReminders = [NotificationInfo]()
    var notifManager =  LocalNotificationManager()
    var locationManager: CLLocationManager?
    //var locationManager = CLLocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchPendingNotifications()
    }
}

extension ReminderViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else if section == 1{
            return pendingReminders.count
        }
        else{
            return 1
        }
        
    }
    class func newInstance()->ReminderViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "ReminderViewController") as! ReminderViewController
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
                cell.configure(info: pendingReminders[indexPath.row])
                return cell
            }
        }
        else if indexPath.section == 2{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherTableViewCell{
                getUserCurrentLocation()
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            let descVC = ReminderDescriptionViewController.newInstance()
            let selectedReminderInfo = pendingReminders[indexPath.row]
            descVC.info = selectedReminderInfo
            self.navigationController?.pushViewController(descVC, animated: true)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 100
        }
        else if indexPath.section == 1{
            return 100
        }
        return 120
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TableViewHeaderView.newInstance()
        if section == 0{
            view.lblTitle2.isHidden = true
            view.configure(title: "Create Reminder")
        }else if section == 1{
            view.lblTitle2.isHidden = false
            view.configure(title: "My Reminders")
            view.lblTitle2.text = "Total : \(pendingReminders.count)"
        }
        else{
            view.lblTitle2.isHidden = true
            view.configure(title: "Today's Weather")
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func fetchPendingNotifications(){
        notifManager.getListOfPendingNotifications { [weak self](notifcations) in
            self?.pendingReminders = notifcations
            DispatchQueue.main.async {
                self?.tblview.reloadData()
            }
        }
    }
}
extension ReminderViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined {
        
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func getUserCurrentLocation(){
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestLocation()
    }
    
}
