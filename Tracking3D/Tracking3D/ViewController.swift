//
//  ViewController.swift
//  Tracking3D
//
//  Created by Mac on 11/18/14.
//  Copyright (c) 2014 tianshuanggao. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    var track:Tracking = Tracking();
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sleep(1);
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(){
        track.update();
    }
    
    
}
