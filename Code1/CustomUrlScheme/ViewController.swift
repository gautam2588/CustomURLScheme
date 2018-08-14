//
//  ViewController.swift
//  CustomUrlScheme
//
//  Created by Gautam Arora on 08/08/18.
//  Copyright © 2018 Gautam Arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /***** This will be customeUrlScheme where you want your application to redirect*******/
    let kCustomURLScheme = "sampleapplicationscheme"  //"sampleapplicationscheme://"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Button to call custom url scheme
    /*
     Purpose:--  To call custom url scheme method
     */
    
    @IBAction func btnActionCallCustomUrl(_ sender: Any) {
        openCustomApplication()
    }
    
    
    /*
     Purpose:--  To check if the custom url svheme has been matched if yes, will redirect togiven application else will not
     */
    func openCustomApplication() {
        if openCustomURLApplicationScheme(customURLScheme: kCustomURLScheme) {
            print("app was opened successfully")
        } else {
            // If you unable to open the application best is to redirect the application to itunes store
            /*********** For testing I have given whatsapp itunes link ********/
            
            guard let url = URL(string: "https://itunes.apple.com/us/app/plex/id383457673?mt=8") else {
                return
            }
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    /*
     Purpose:--  If condition is true it will open the application based on url scheme
     */
    func openCustomURLApplicationScheme(customURLScheme: String) -> Bool {
        let customURL = URL(string: customURLScheme)!
        if UIApplication.shared.canOpenURL(customURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(customURL)
            } else {
                UIApplication.shared.openURL(customURL)
            }
            return true
        }
        
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

