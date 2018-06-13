//
//  CatModel.swift
//  randomAnimal
//
//  Created by Chiara Amato on 05/06/18.
//  Copyright © 2018 CHR. All rights reserved.
//

import UIKit

class CatModel: AnimalModel {
    
    var legs: Int
    
    init(name: String, legs: Int, imageLink: String){
        self.legs = legs
        super.init(name:name, imageLink: imageLink)
    }
    
    override func animalCall() -> String{
        return "miao miao"
    }

}
