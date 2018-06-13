//
//  BirdModel.swift
//  randomAnimal
//
//  Created by Chiara Amato on 05/06/18.
//  Copyright © 2018 CHR. All rights reserved.
//

import UIKit

class BirdModel: AnimalModel {
    
    var wings: Int
    
    init(name: String, wings: Int, imageLink: String){
        self.wings = wings
        super.init(name:name, imageLink: imageLink)
    }
    
    override func animalCall() -> String{
        return "cip cip"
    }
}
