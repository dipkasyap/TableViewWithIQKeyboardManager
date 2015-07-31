//
//  ViewController.swift
//  text
//
//  Created by apple on 7/30/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        IQKeyboardManager.sharedManager().toolbarManageBehaviour = IQAutoToolbarManageBehaviour.ByPosition

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "\(indexPath.section) \(indexPath.row)"
        
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell
        
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
            cell?.backgroundColor = UIColor.clearColor()
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            
            let contentView : UIView! = cell?.contentView
            
            if ((indexPath.row % 2) == 0) {
                
                let textField = UITextField(frame: CGRectMake(5,5,contentView.frame.size.width-10,30))
                textField.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleWidth
                textField.placeholder = identifier
                textField.backgroundColor = UIColor.clearColor()
                textField.borderStyle = UITextBorderStyle.RoundedRect
                cell?.contentView.addSubview(textField)
                
            } else {
                
                let textView = UITextView(frame: CGRectInset(contentView.bounds, 5, 5))
                textView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
                textView.text = "Sample Text"
                cell?.contentView.addSubview(textView)
            }
        }
        
        return cell!
    }    }

 

