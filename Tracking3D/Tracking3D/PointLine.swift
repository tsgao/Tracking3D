//
//  PointLine.swift
//  DrawLine
//
//  Created by Li Zehua on 11/30/14.
//  Copyright (c) 2014 Li Zehua. All rights reserved.
//

import UIKit

class PointLine {
    
    
    var BGView:UIView = UIView(frame: CGRectMake(0, 0, 320, 320))
    
    var lastPoint:CGPoint = CGPoint()
    var pointsCount = 0
    
    var LinesView:UIView
    init(){
        LinesView = UIView(frame: CGRectMake(BGView.frame.minX + 10, BGView.frame.minY + 10, BGView.frame.maxX - 10, BGView.frame.maxY - 10))
//
//        BGView.addSubview(LinesView)
    }
    
    init(superView:UIView){
        BGView = superView
        LinesView = UIView(frame: CGRectMake(BGView.frame.minX + 10, BGView.frame.minY + 10, BGView.frame.maxX - 10, BGView.frame.maxY - 10))
//
//        BGView.addSubview(LinesView)
        
    }
    
    func addLineView(){
        LinesView = UIView(frame: CGRectMake(BGView.frame.minX + 10, BGView.frame.minY + 10, BGView.frame.maxX - 10, BGView.frame.maxY - 10))
        BGView.addSubview(LinesView)
        pointsCount = 0
    }
    
    func drawLineToPoint(point:CGPoint){
        if(pointsCount != 0){
            var polygonShapeLayer:CAShapeLayer = CAShapeLayer()
            polygonShapeLayer.fillColor = UIColor.lightGrayColor().CGColor
            polygonShapeLayer.strokeColor = UIColor.grayColor().CGColor
            polygonShapeLayer.lineWidth = 2
            var path:UIBezierPath = UIBezierPath()
            path.moveToPoint(lastPoint)
            path.addLineToPoint(point)
            polygonShapeLayer.path = path.CGPath
            LinesView.layer.addSublayer(polygonShapeLayer)
            LinesView.layer.borderColor = UIColor.blackColor().CGColor
        }
            lastPoint = point

        pointsCount++
    }
    
    func cleanView(){
        LinesView.removeFromSuperview();
    }

}
