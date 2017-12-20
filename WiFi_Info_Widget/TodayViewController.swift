//
//  TodayViewController.swift
//  WiFi_Info_Widget
//
//  Created by naver on 2017. 12. 20..
//  Copyright © 2017년 ansi. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var ssid_Lbl:UILabel!
    @IBOutlet var ipAddr_Lbl:UILabel!
    @IBOutlet var disconnect_Lbl:UILabel!
    @IBOutlet var moveToSet_Btn:UIButton!
    @IBOutlet var ap_Mac_Lbl:UILabel!
    var info = WiFi_Info()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
       upDateData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
        upDateData()
    }
    
    
    func upDateData(){
        let cInfo = info.getInfo()
        
        if cInfo[0] != nil{
            ssid_Lbl.text = "SSID : \(cInfo[0]!)"
            ipAddr_Lbl.text = "IP : \(cInfo[2]!)"
            ap_Mac_Lbl.text = "AP's Mac : \(cInfo[1]!)"
            disconnect_Lbl.text = ""
        }
        else{
                disconnect_Lbl.text = "WIFI is disconnect. \n turn on the WIFI"
            ap_Mac_Lbl.text = ""
            
            ssid_Lbl.text = ""
            ipAddr_Lbl.text = ""
        }
  
    }
    
    
    @IBAction func moveToSetting(){
        
        if let url = URL(string : "App-Prefs:root=WIFI"){
            extensionContext?.open(url, completionHandler: nil)
            
        }
        
    }
    
    
    
}
