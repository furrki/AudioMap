//
//  DotGraphView.swift
//  AudioMap
//
//  Created by Admin on 16.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit
import Foundation

class DotGraphView: UIView {
    var amps: [Double] = []
    var freqs: [Double] = []
    
    var w = 200.0
    var h = 200.0
    
    let maxFreq = 1661.0
    let maxAmp = 0.3
    let minFreq = 55.0
    let minAmp = 0.055

    var xPadding: Double {
        get {
            return w * 0.2
        }
    }
   
    var yPadding: Double {
        get {
            return h * 0.2
        }
    }
    
    override func prepareForInterfaceBuilder() {
        self.prepareForInterfaceBuilder()
        customize()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customize()
    }
    
    func customize(){
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
    }
    
    func add(freq: Double, amp: Double){
        
        print(amp, freq)
        if freq < minFreq || amp < minAmp || freq > maxFreq || amp > maxAmp {
            return
        }
        amps.append(amp)
        freqs.append(freq)
        let circle = CircledDotView()
        circle.frame = CGRect(x: freq * (w / maxFreq) + xPadding, y: amp * (h / maxAmp) + yPadding, width: 3, height: 3)
        
        addSubview(circle)
        layoutSubviews()
    }
    
    func reset(){
        self.amps = []
        self.freqs = []
        for sv in subviews.filter({ $0 is CircledDotView }) {
            sv.removeFromSuperview()
        }
        layoutSubviews()
    }
}

