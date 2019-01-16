//
//  DarkButton.swift
//  AudioMap
//
//  Created by Admin on 16.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class LightButton: UIButton {

    override func prepareForInterfaceBuilder() {
        self.prepareForInterfaceBuilder()
        customize()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customize()
    }
   

    func customize(){
        self.setTitleColor(UIColor.black, for: .normal)
        self.backgroundColor = UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7)
        self.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
    }
    
   
    
}
