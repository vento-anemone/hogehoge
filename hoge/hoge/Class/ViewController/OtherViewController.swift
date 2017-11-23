//
//  OtherViewController.swift
//  hoge
//
//  Created by hoge on 2017/11/23.
//  Copyright © 2017年 hoge. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "aaa"
        self.tableview.register(UINib.init(nibName: "CustomTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CustomCell")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if let selectIndexPath = tableview.indexPathForSelectedRow {
            tableview.deselectRow(at: selectIndexPath, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "AAAA"
            cell.detailTextLabel?.textColor = UIColor.clear
        default:
            cell.textLabel?.text = "BBBB"
            let infoDictionary = Bundle.main.infoDictionary!
            if let version = infoDictionary["CFBundleShortVersionString"] as? String,
                let build = infoDictionary["CFBundleVersion"] as? String {
                cell.accessoryType = .none
                cell.detailTextLabel?.text = version + "." + build
            }
            cell.selectionStyle = .none
        }
        return cell
    }
    

}
