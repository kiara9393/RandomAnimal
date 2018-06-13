//
//  AnimalModel.swift
//  randomAnimal
//
//  Created by Chiara Amato on 05/06/18.
//  Copyright © 2018 CHR. All rights reserved.
//

import UIKit

class AnimalModel: NSObject {
    
    var name: String
    var imageLink: String?
    
    init(name: String, imageLink: String?){
        self.name = name
        
        if let image = imageLink{
            self.imageLink = image
        }
    }
    
    func animalCall() -> String{
        return ""
    }
}
