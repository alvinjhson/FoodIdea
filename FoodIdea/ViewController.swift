//
//  ViewController.swift
//  FoodIdea
//
//  Created by Alvin Johansson on 2024-03-19.
//

import UIKit

class ViewController: UIViewController {
    let segueId = "goToSecondSegue"
    var food = AddFoodViewController()
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var foodType: UILabel!
    @IBOutlet weak var contry: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addRecipeButton(_ sender: UIButton) {
        //performSegue(withIdentifier:segueId, sender: self)
    }
    
    @IBAction func randomFoodButton(_ sender: Any) {
            if let randomFood = food.getRandomFood() {
                print("Hittade mat: \(randomFood.description)")
                desc.text = randomFood.description
                foodType.text = randomFood.foodType
                contry.text = randomFood.country
            } else {
                print("Ingen mat hittades!")
            }
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId {
            if let destinationVC = segue.destination as? AddFoodViewController{
                
            
                
            }
        }
    }
    
}

