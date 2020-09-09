//
//  TableViewHeaderView.swift
//  Reminder
//
//  Created by RAHUL GOEL on 06/09/20.
//

import UIKit

class TableViewHeaderView: UIView {

    @IBOutlet weak var lblTitle: UILabel!
    
    func configure(title : String){
        lblTitle.text = title
    }
    
    class func newInstance()->TableViewHeaderView{
        return UINib(nibName: "TableViewHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TableViewHeaderView
    }
}
