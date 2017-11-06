//
//  TostView.swift
//
//  Created by ckjdev on 2016. 6. 23..
//  Copyright © 2016년 Yes24. All rights reserved.
//

import Foundation
import UIKit

@objcMembers
class TostView:UIView {
    static func tostText(_ text:String, duration:TimeInterval, onView:UIView, inset:UIEdgeInsets) {
        let tostLabel = UILabel()
        tostLabel.textColor = UIColor.white
        tostLabel.backgroundColor = UIColor.black
        tostLabel.font = UIFont.systemFont(ofSize: 13)
        tostLabel.numberOfLines = 0;
        tostLabel.textAlignment = NSTextAlignment.center
        tostLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        tostLabel.text = text;
        tostLabel.sizeToFit()
        tostLabel.clipsToBounds = true;
        tostLabel.layer.cornerRadius = 5.0
        
        onView.addSubview(tostLabel)
        
        var frame = CGRect.zero
        let maxSize = CGSize(width: 250, height: 100)
        let size = NSString(string: tostLabel.text!).size(withFont2:tostLabel.font, constrainedToSize: maxSize);
        
        frame.origin.x = (onView.frame.size.width - size.width - 20) / 2.0
        if (inset.left == 0 && inset.right == 0) == false {
            if (inset.left != 0) {
                frame.origin.x = inset.left
            }
            
            if (inset.right != 0) {
                frame.origin.x = onView.frame.size.width - inset.right
            }
        }
        
        frame.origin.y = onView.center.y + onView.frame.size.height / 3.0
        if (inset.top == 0 && inset.bottom == 0) == false {
            if (inset.top != 0) {
                frame.origin.y = inset.top
            }
            
            if (inset.bottom != 0) {
                frame.origin.y = onView.frame.size.height - inset.bottom
            }
        }
        frame.size.width = size.width + 20;
        frame.size.height = size.height + 15;

        tostLabel.frame = frame;
        
        UIView.animate(withDuration: duration, animations: {
            tostLabel.alpha = 0
            }, completion: {
                (value: Bool) in
                tostLabel.alpha = 1
                tostLabel.removeFromSuperview()
        })
    }
    
    static func tostText(_ text:String, duration:TimeInterval, onView:UIView) {
        TostView.tostText(text, duration: duration, onView: onView, inset: UIEdgeInsets.zero)
    }
}

