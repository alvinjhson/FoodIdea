//
//  AddFoodViewController.swift
//  FoodIdea
//
//  Created by Alvin Johansson on 2024-03-19.
//

import Foundation
import UIKit

class AddFoodViewController : UIViewController , UITextFieldDelegate {
    var country: String = ""
    var foodType: String = ""
    var desc: String = ""
    @IBOutlet weak var contryTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var foodTypeTextField: UITextField!
    struct Food: Codable {
        var country: String
        var foodType: String
        var description: String
    }
    var foods: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFoods()
        print("Hello1")
        contryTextField.delegate = self
        descTextField.delegate = self
        foodTypeTextField.delegate = self
 
    }
 

    @IBAction func Add(_ sender: UIButton) {
        addFood()
        
    }
    
    
    func saveFoods() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(foods) {
            UserDefaults.standard.set(encoded, forKey: "foods")
        }
    }
    func addFood() {
        
        country = contryTextField.text ?? ""
        foodType = foodTypeTextField.text ?? ""
        desc = descTextField.text ?? ""
        print(contryTextField)
        print(foodTypeTextField)
        print(descTextField)
        

        // Skapa en ny Food-instans med de uppdaterade värdena
        let newFood = Food(country: country, foodType: foodType, description: desc)
        
        // Lägg till den nya maträtten i din array
        foods.append(newFood)
        
        // Spara din uppdaterade matlista
        saveFoods()
    }

    func loadFoods() {
        if let savedFoods = UserDefaults.standard.object(forKey: "foods") as? Data {
            let decoder = JSONDecoder()
            if let loadedFoods = try? decoder.decode([Food].self, from: savedFoods) {
                foods = loadedFoods
             
            }
        }
    }
   
    func getRandomFood() -> Food? {
        if let savedFoods = UserDefaults.standard.object(forKey: "foods") as? Data {
            let decoder = JSONDecoder()
            if let loadedFoods = try? decoder.decode([Food].self, from: savedFoods) {
                let filteredFoods = loadedFoods.filter { !$0.country.isEmpty && !$0.foodType.isEmpty && !$0.description.isEmpty }
                return filteredFoods.randomElement()
            }
        }
        return nil
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == contryTextField {
            country = textField.text ?? ""
        } else if textField == foodTypeTextField {
            foodType = textField.text ?? ""
        } else if textField == descTextField {
            desc = textField.text ?? ""
        }
    }
    


    
  
    @IBAction func countryTextField(_ sender: UITextField) {
    }
    
    @IBAction func foodType(_ sender: UITextField) {
    }
    
    @IBAction func description(_ sender: UITextField) {
    }
     
}
