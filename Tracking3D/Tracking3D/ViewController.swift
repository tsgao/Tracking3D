//
//  ViewController.swift
//  Tracking3D
//
//  Created by Mac on 11/18/14.
//  Copyright (c) 2014 tianshuanggao. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet var MasterView: UIView!
    
    var timer = NSTimer()
    var pl:PointLine = PointLine()
    var track:Tracking = Tracking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //         Do any additional setup after loading the view, typically from a nib.
        pl = PointLine(superView: MasterView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var TitleLabel: UILabel!
    @IBAction func StartButton(sender: AnyObject) {
        TitleLabel.text = "Running!"
        track = Tracking()
        pl.addLineView()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("drawLine"), userInfo: nil, repeats: true)
    }
    @IBAction func StopButton(sender: AnyObject) {
        TitleLabel.text = "Stopped!"
        timer.invalidate()
    }
    
    
    
    func drawLine(){
        track.update()
        var currentPoint:CGPoint = CGPoint(x: CGFloat(track.position_y*200+150), y: CGFloat(track.position_x*200+150))
        pl.drawLineToPoint(currentPoint)
    }
    
    
    @IBAction func CleanButton(sender: AnyObject) {
        TitleLabel.text = "Stopped!"
        pl.cleanView()
    }
}
