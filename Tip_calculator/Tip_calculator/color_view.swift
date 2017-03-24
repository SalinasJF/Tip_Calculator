//
//  color_view.swift
//  Tip_calculator
//
//  Created by CampusUser on 3/19/17.
//  Copyright © 2017 JorgeSalinas. All rights reserved.
//

import UIKit

extension CGContext{
    func setFillColor(_ hex:Int ){
        //Mask different values of the hex code
        //0xff0000 -- Red
        //0x00FF00 -- Green
        //0x0000FF == Blue
        
        let redColor: CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor: CGFloat = CGFloat(( hex >> 8 ) & 0xFF) / 255.0
        let blueColor: CGFloat = CGFloat(hex & 0xFF) / 255.0
        
        setFillColor(red: redColor, green: greenColor, blue: blueColor,alpha: 1.0)
    }
    
    
}


class color_view: UIView {

    let colorPrice: Double = Double(costWODiscounts)!
    let colorSaved: Double = Double(savedMoney)!
    let colorDiscount: Double = Double (discountedPrice)!
    
    override func draw(_ rect: CGRect) {
        let context:CGContext = UIGraphicsGetCurrentContext()!
        let saved:CGContext = UIGraphicsGetCurrentContext()!
        let payed:CGContext = UIGraphicsGetCurrentContext()!
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let leftGuide: CGFloat = 0
        let rightGuide: CGFloat = screenWidth - 16
        
        let topGuide: CGFloat = 56.0    //56.0
        let botGuide: CGFloat = screenHeight - 32.0
        
        context.setFillColor(0x84516D)
        context.fill(CGRect(x: leftGuide, y: topGuide, width:screenWidth/2,
                            height: screenHeight - 32.0))
        
        saved.setFillColor(0xFF5733)
        saved.fill(CGRect(x: screenWidth/2, y: topGuide, width: screenWidth/2,
                             height: screenHeight-32.0))
        
        let payPosition: CGFloat = CGFloat(colorDiscount/colorPrice)
        
        payed.setFillColor(0x890045)
        payed.fill(CGRect(x: screenWidth/2, y: (screenHeight * payPosition), width: screenWidth/2,
                          height: screenHeight-32.0))
        
        
        // Drawing code
        
        //Draw Text:
        let myText = "Original Price "
        let subText = "$ " + String(colorPrice)
        
        let saveText = "You Saved "
        let saveTextSubText = "$  " + String(colorSaved)
        
        let youPay = "You Payed "
        let youPaySubText = "$ " + String(colorDiscount)
        
        // myText.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0))
        //subText.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 32.0))
        
        //Text Attributes
        let textAttributes = [NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!,
                              NSForegroundColorAttributeName: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]
        let myTextPos: CGPoint = CGPoint(x: leftGuide + 16.0,y: topGuide + 16.0)
        
        myText.draw(at: myTextPos, withAttributes: textAttributes)
        subText.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 32.0),
                     withAttributes: textAttributes)
        
        youPay.draw(at: CGPoint(x: screenWidth/2 + 16, y: topGuide + 16.0),
                      withAttributes: textAttributes)
        youPaySubText.draw(at: CGPoint(x: screenWidth/2 + 16, y: topGuide + 32.0),
                           withAttributes: textAttributes)
        
        saveText.draw(at: CGPoint(x: screenWidth/2 + 16, y: (screenHeight * payPosition) + 16.0),
                      withAttributes: textAttributes)
        saveTextSubText.draw(at: CGPoint(x: screenWidth/2 + 16, y: (screenHeight * payPosition) + 32.0),
                      withAttributes: textAttributes)
        
        
        
        
        /*
         add this to calculator view
         func textFieldDidEndEditing(_ textFiled: UITextField){
         grabValues()
         }
         
         
         */
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
