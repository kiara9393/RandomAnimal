//
//  BlueViewController.swift
//  randomAnimal
//
//  Created by Chiara Amato on 11/06/18.
//  Copyright © 2018 CHR. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    @IBOutlet weak var welcomeMessage: UILabel!
    @IBOutlet weak var character: UILabel!
    
    
    var message: String?
    var item: AnimalModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let myMessage = message {
            print("myMessage = \(myMessage)")
            
            self.welcomeMessage.text = myMessage
        }
        else {
            self.welcomeMessage.text = "no one animal Selected"
        }
        
        if let myItem = item {
            self.welcomeMessage.text = myItem.name
            
            if myItem is DogModel {
                let animal = item as! DogModel
                self.character.text = String(animal.legs)
            }
            else if myItem is CatModel {
                let animal = item as! CatModel
                self.character.text = String(animal.legs)
            }
            else if myItem is BirdModel {
                let animal = item as! BirdModel
                self.character.text = String(animal.wings)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("BlueVC: viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("BlueVC: viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("BlueVC: viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
         print("BlueVC: viewDidDisappear")
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeBlueVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
