//
//  testViewController.swift
//  hoge
//
//  Created by kazuya on 2017/12/05.
//  Copyright © 2017年 hoge. All rights reserved.
//

import UIKit
import SafariServices

class testViewController: UIViewController, SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapSafari(_ sender: Any) {
        let googleUrl = NSURL(string: "https://google.co.jp")
        
        if let googleUrl = googleUrl {
            let safariViewController = SFSafariViewController(url: googleUrl as URL)
            safariViewController.delegate = self
            self.present(safariViewController, animated: false, completion: nil)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        NSLog("safariViewControllerDidFinish \(controller)")
    }
    
    func safariViewController(_ controller: SFSafariViewController, initialLoadDidRedirectTo URL: URL) {
        NSLog("initialLoadDidRedirectTo \(controller)")
        NSLog("initialLoadDidRedirectTo \(URL)")
    }
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        NSLog("didCompleteInitialLoad \(controller)")
        NSLog("didCompleteInitialLoad \(didLoadSuccessfully)")
    }
    
//    func safariViewController(_ controller: SFSafariViewController, activityItemsFor URL: URL, title: String?) -> [UIActivity] {
//        <#code#>
//    }
//
//    func safariViewController(_ controller: SFSafariViewController, excludedActivityTypesFor URL: URL, title: String?) -> [UIActivityType] {
//        <#code#>
//    }
}
