//
//  ViewController.swift
//  SampleTask
//
//  Created by SAMEERA on 22/04/20.
//  Copyright © 2020 Sameera. All rights reserved.
//

import UIKit
import Toast_Swift

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
 
 
 
 @IBOutlet weak var numberTF: UITextField!
 

 var style: ToastStyle!
 var numbers = ["1","2","3","4","5","6","7","8","9"," ","0","✕"]
 

 override func viewDidLoad() {
     super.viewDidLoad()
     
     numberTF.layer.borderColor = #colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)
     numberTF.layer.borderWidth = 2
     
    // create a new style
     style = ToastStyle()

     // Do any additional setup after loading the view.
 }
 
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
     return numbers.count
 }
 
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
     var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
     
     cell.numberLabel.text = numbers[indexPath.item]
     
     return cell
     
 }
 
 func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
     
     var number = numbers[indexPath.row]
     print(number)
     
     if(number == "✕") {
         
         self.numberTF.text! = String((numberTF.text?.dropLast())!)
         collectionView.reloadData()
         
         
     }else{
          numberTF.text! += number
         collectionView.reloadData()
     }
     
     
 }
 

 @IBAction func onOTPButtonTap(_ sender: Any) {
     
     
      if(numberTF.text?.count == 16) {
         
         // this is just one of many style options
         style.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
         style.messageColor = .green
         
         self.view.makeToast("OTP sent to your mobile number", duration: 3.0, position: .top, style: self.style) //Toast notification
       
             
      }else{
         
         // this is just one of many style options
         style.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
         style.messageColor = .red
         
         self.view.makeToast("Please enter 10 digit mobile number", duration: 3.0, position: .top, style: self.style) //Toast notification
         
     
    }
 }
    
}


