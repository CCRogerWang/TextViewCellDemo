//
//  TextCell.swift
//  DemoTextViewCell
//
//  Created by Roger on 2018/6/30.
//  Copyright © 2018年 Roger. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    var indexPath:IndexPath!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(superV: UIView?) -> UIView {
        if let view = superV, view.isKind(of: UITableView.classForCoder()) {
            return view
        } else if superV == nil{
            print("Can't be nil!!!")
            return UIView()
        } else {
            return tableView(superV: superview)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let tableView = self.tableView(superV: superview) as! UITableView
        
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        textView.scrollRangeToVisible(NSMakeRange(textView.text.count-1, 0))
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        
    }
}
