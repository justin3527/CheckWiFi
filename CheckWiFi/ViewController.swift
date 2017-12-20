//
//  ViewController.swift
//  CheckWiFi
//
//  Created by naver on 2017. 12. 20..
//  Copyright © 2017년 ansi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ssid_Lbl:UILabel!
    @IBOutlet var ipAddr_Lbl:UILabel!
    @IBOutlet var moveToSet_Btn:UIButton!
    @IBOutlet var refresh_Btn:UIButton!
    @IBOutlet var ap_Mac_Lbl:UILabel!
    let info = WiFi_Info()
    override func viewDidLoad() {
        super.viewDidLoad()
        upDateData()
        var appGroupDefaults = UserDefaults.standard
            
        appGroupDefaults = UserDefaults(suiteName:"group.study.CheckWiFi_Data")!
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func upDateData(){
        let cInfo = info.getInfo()
        
        if cInfo[0] != nil{
            ssid_Lbl.text = "SSID : \(cInfo[0]!)"
            ap_Mac_Lbl.text = "AP's Mac : \(cInfo[1]!)"
            ipAddr_Lbl.text = "IP : \(cInfo[2]!)"
            
            
        }
        else{
            ap_Mac_Lbl.text = "WIFI is disconnect. \n turn on the WIFI"
            ssid_Lbl.text = ""
            ipAddr_Lbl.text = ""
        }
        
    }
    
    @IBAction func refreshStatus(){
        upDateData()
    }
    
    @IBAction func moveToSetting(){
        
        if let url = URL(string : "App-Prefs:root=WIFI"){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            
        }
        
    }



}

