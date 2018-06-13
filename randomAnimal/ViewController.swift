//
//  ViewController.swift
//  randomAnimal
//
//  Created by Chiara Amato on 05/06/18.
//  Copyright © 2018 CHR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameOfAnimal: UILabel!
    @IBOutlet weak var typeOfCharacter: UILabel!
    @IBOutlet weak var callLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var simpleNext: UIButton!
    
    
    
    
    var myDataSource = [AnimalModel]()
    
    var randomNumber: Int?
    
    var isEnable: Bool{
        get{
            if self.randomNumber != nil{
                return true
            }
            else{
                return false
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.populateDataSource()
        self.callButton.isEnabled = self.isEnable
        
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
        
        self.simpleNext.isHidden = true

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("BlueVC: viewDidDisappear")
    }
    
    
    
    
    
    func populateDataSource(){
        let dago: DogModel = DogModel.init(name: "Dago", legs: 4, imageLink: "labrador")
        let bob: DogModel = DogModel.init(name: "Bob", legs: 4, imageLink: "dog")
        let zoe: CatModel = CatModel.init(name: "zoe", legs: 4, imageLink: "cat")
        let titty: BirdModel = BirdModel.init(name: "Titty", wings: 2, imageLink: "bird")
        
        self.myDataSource = [dago, bob, zoe, titty]
    }
    
    
    
    @IBAction func randomAction(_ sender: Any) {
        self.setView()
    }
    
    
    
    func setView (){
        print("random Action called")
        
        self.randomNumber = Int(arc4random_uniform(UInt32(self.myDataSource.count)))
        
        self.callButton.isEnabled = self.isEnable
        
        if let myRandomNumber = self.randomNumber{
            
            print("random number = \(myRandomNumber)")
            
            let item = self.myDataSource[myRandomNumber]
            
            if item is DogModel{
                let animal = item as! DogModel
                print("legs = \(animal.legs)")
                
                self.nameOfAnimal.text = animal.name
                self.typeOfCharacter.text = String(animal.legs)
                self.myImageView.image = UIImage.init(named: animal.imageLink!)
            }
                
            else if item is CatModel{
                let animal = item as! CatModel
                print("legs = \(animal.legs)")
                
                self.nameOfAnimal.text = animal.name
                self.typeOfCharacter.text = String(animal.legs)
                self.myImageView.image = UIImage.init(named: animal.imageLink!)
                
            }
            else if item is BirdModel{
                let animal = item as! BirdModel
                print("wings = \(animal.wings)")
                
                self.nameOfAnimal.text = animal.name
                self.typeOfCharacter.text = String(animal.wings)
                self.myImageView.image = UIImage.init(named: animal.imageLink!)
            }
            print(item.name)
        }
    }
    
    
    func refreshViews(name: String, caracter: String, image: UIImage){
        self.nameOfAnimal.text = name
        self.typeOfCharacter.text = caracter
        self.myImageView.image = image
    }
    
    
    @IBAction func callAction(_ sender: Any) {
        if let myRandomNumber = self.randomNumber{
            
            print("random number = \(myRandomNumber)")
            
            let item = self.myDataSource[myRandomNumber]
            
            if item is DogModel{
                let animal = item as! DogModel
                self.callLabel.text = animal.animalCall()
            }
                
            else if item is CatModel{
                let animal = item as! CatModel
                self.callLabel.text = animal.animalCall()
                
            }
            else if item is BirdModel{
                let animal = item as! BirdModel
                self.callLabel.text = animal.animalCall()
            }
        }
    }
    
    //primo metodo
    @IBAction func goToDetailVC(_ sender: Any) {
        print("goToDetailVC")
        
        self.performSegue(withIdentifier: "showDetailsVC", sender: self)
    }
    
    // secondo metodo: con passaggio di informazioni
    
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
            
            if segue.identifier == "showBlueVC"{
                print("vado su showBlueVC")
                
                let destinationVC = segue.destination as! BlueViewController
                //destinationVC.message = "ciao BlueVC"
                
                if let random = self.randomNumber{
                    let item = self.myDataSource[random]
                    
                    destinationVC.message = item.name
                    destinationVC.item = item
 
                }
            }
            else if segue.identifier == "showBlueController"{
                print("devo andare in\(String(describing:segue.identifier))")
            }
            
            print("prepare for segue")
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
