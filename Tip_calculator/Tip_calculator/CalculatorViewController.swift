//
//  CalculatorViewController.swift
//  Test
//
//  Created by CampusUser on 2/27/17.
//  Copyright © 2017 JorgeSalinas. All rights reserved.
//

import UIKit

var initialPrice: String = ""
var discountedPrice: String = ""
var savedMoney: String  = ""
var costWODiscounts: String = ""    //costWithoutDicounts

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!
    @IBOutlet weak var dollarsOffTextField: UITextField!
    @IBOutlet weak var discountPercentTextField: UITextField!
    @IBOutlet weak var otherDiscountTextField: UITextField!
    @IBOutlet weak var originalPriceTextField: UITextField!
    @IBOutlet weak var discountedPriceTextField: UITextField!
    
    
    
    @IBAction func CalculatePrice(_ sender: UIButton) {
        initialPrice = (priceTextField.text!)
        //set global initial price
        let originalPrice: Double = Double(initialPrice)!        //save original price
        
      let taxation = Double(priceTextField.text!)! * 0.075
        taxTextField.text = String(taxation)
        
        let dollarsOff = Double(dollarsOffTextField.text!)
        
        let discountpercent = Double(discountPercentTextField.text!)! * 0.01
        let otherDiscountPercent = Double(otherDiscountTextField.text!)! * 0.01
   
        costWODiscounts = String(originalPrice + taxation)          //find initial price + tax
        originalPriceTextField.text = (costWODiscounts)             //set textfield
        
        
        var calculations =  Double(initialPrice)! - dollarsOff!         //calculate discounts
        calculations = calculations - (originalPrice*discountpercent)
        calculations = calculations - (originalPrice*otherDiscountPercent)
        
        calculations = calculations + taxation
        
        let calculatedFinalPrice = calculations
        discountedPrice = String(calculatedFinalPrice)       //set global discounted price
        savedMoney = String(originalPrice-calculatedFinalPrice) //set global savedmoney variable
     
        
        discountedPriceTextField.text = String(describing: calculatedFinalPrice)
     
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Make Swipe Gestures
        let swipeleft:UISwipeGestureRecognizer =
            UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        
        swipeleft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeleft)
        
        //handleSwipe is a function down below...
        //#selector() selects and executes that function
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Prepare segue for data transfer
    
    //Swipe Function
    func handleSwipe(_ sender:UIGestureRecognizer){
        self.performSegue(withIdentifier: "ShowResults", sender: self)
        
    }
    
    //Endable unwinding other views
    @IBAction func unwindToCalc(segue: UIStoryboardSegue){}
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

