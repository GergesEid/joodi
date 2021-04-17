//
//  RigesterAnOrderExtension + UITextfieldDelegate.swift
//  JOODI
//
//  Created by Gerges on 14/04/2021.
//

import Foundation
import  UIKit
import Toast_Swift

extension RegisterAnOrdeerViewController: UITextFieldDelegate {
    // set delegate
    func setDelegate () {
        nameTxtField.delegate = self
        phoneNoTxtField.delegate = self
        timeTxtField.delegate = self
        shoppersTxtField.delegate = self
        addressTxtField.delegate = self
    }
    
    // cheack if number valid
    func isValidNumber(testStr:String) -> Bool {
        let mobileRegEx = "[0-9]{2,64}"
        let numberTest = NSPredicate(format:"SELF MATCHES %@", mobileRegEx)
        return numberTest.evaluate(with: testStr)
    }
    
    // inform user to enter more than 8 digit
    func informUserError () {
        addBorderToViewError(view:viewOfPhoneNo)
        self.view.makeToast("Please enter your valid number with 8 digit or more",duration: 4.0, position: .top)
    }
    
    // chack if the numbr is valid and digit count
    func checkValid () {
        dismissKeyboard()
        let mobileNo = phoneNoTxtField.text
        let digitCount = phoneNoTxtField.text?.count
        let validMobile = isValidNumber(testStr: mobileNo!)
        if validMobile {
            print("number is validMobile")
            // check digit count is 8 or more
            if digitCount! >= 8 {
                // if phoneNoTxtField is not empty
                addBorderToViewEmpty(view:viewOfPhoneNo)
                print("digitCount is >= 8")
            } else {
                print("digitCount is not >= 8")
                // notify the user there is error in number
                informUserError ()
            }
        } else {
            print("number is not validMobile")
            // notify the user there is error in number
            informUserError ()
        }
    }
    
    // open calender view controller
    func openCalender () {
        dismissKeyboard()
        NotificationCenter.default.addObserver(forName: .saveDate, object: nil, queue: OperationQueue.main) { (notification) in
            let vc = notification.object as! calendarTimeViewController
            
            self.timeTxtField.text = "\(vc.formattedDateDayOfWeek), \(vc.formattedDateNumberOfDay) \(vc.formattedDateMonth) \(vc.formattedDateYear), at \(vc.formattedDateHour):\(vc.formattedDateMinute)"
            
        }
        performSegue(withIdentifier: "calenderId", sender: self)
    }
    
    // open search address
    func openSearchAddress () {
        dismissKeyboard()
        NotificationCenter.default.addObserver(forName: .savePlace, object: nil, queue: OperationQueue.main) { (notification) in
            let vc = notification.object as! googleSearchAddressViewController
            self.addressTxtField.text = vc.str
        }
        performSegue(withIdentifier: "googleSearchId", sender: self)
    }
    
    // MARK:- UITextfield Delegate
    
    // to change border color if user began to type
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTxtField {
            addBorderToViewFilled(view:viewOfName)
        } else if textField == phoneNoTxtField {
            addBorderToViewFilled(view:viewOfPhoneNo)
        } else if textField == timeTxtField {
            dismissKeyboard()
            openCalender ()
            addBorderToViewFilled(view:viewOfTime)
        } else if textField == shoppersTxtField {
            dismissKeyboard()
            addBorderToViewFilled(view: viewOfShoppers)
        } else if textField == addressTxtField {
            openSearchAddress ()
            addBorderToViewFilled(view:viewOfAddress)
        }
    }
    
    // To inform user there are missed field after end editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTxtField {
            // check if nameTxtField is empty
            if nameTxtField.text == "" {
                // if nameTxtField is empty
                addBorderToViewError(view:viewOfName)
            } else {
                // if nameTxtField is not empty
                addBorderToViewEmpty(view:viewOfName)
            }
        } else if textField == phoneNoTxtField {
            // check if phoneNoTxtField is empty
            if phoneNoTxtField.text == "" {
                // if phoneNoTxtField is empty
                addBorderToViewError(view:viewOfPhoneNo)
            } else {
                // chack if the numbr is valid and digit count
                checkValid ()
            }
        } else if textField == timeTxtField {
            // change border to uiview after end editing
            addBorderToViewEmpty(view:viewOfTime)
        } else if textField == shoppersTxtField {
            // change border to uiview after end editing
            addBorderToViewEmpty(view:viewOfShoppers)
        } else if textField == addressTxtField {
            // check if addressTxtField is empty
            if addressTxtField.text == "" {
                // if addressTxtField is empty
                addBorderToViewError(view:viewOfAddress)
            } else {
                // if addressTxtField is not empty
                addBorderToViewEmpty(view:viewOfAddress)
            }
        }
    }
    
    // To inform user there are missed field or do an action
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTxtField {
            // check if nameTxtField is empty
            if textField.text == "" {
                // notify user to enter name
                self.addBorderToViewError(view:viewOfName)
                self.view.makeToast("Please enter your name",duration: 4.0, position: .top)
            } else {
                // make phoneNoTxtField become first responder
                phoneNoTxtField.becomeFirstResponder()
            }
        } else if textField == phoneNoTxtField {
            // check if phoneNoTxtField is empty
            if phoneNoTxtField.text == "" {
                // notify user to enter phone number
                self.addBorderToViewError(view:viewOfPhoneNo)
                self.view.makeToast("Please enter phone number",duration: 4.0, position: .top)
            } else {
                // chack if the numbr is valid and digit count
                checkValid ()
                // make timeTxtField become first responder
                timeTxtField.becomeFirstResponder()
                // open time view controller to select ***************************
                openCalender ()
            }
        } else if textField == shoppersTxtField {
            // make phoneNoTxtField become first responder
            addressTxtField.becomeFirstResponder()
            // open address view controller to search location ***************************
            openSearchAddress ()
        } else if textField == addressTxtField {
            // check if addressTxtField is empty
            if addressTxtField.text == "" {
                self.addBorderToViewError(view:viewOfAddress)
                self.view.makeToast("Please enter your address to deliver your order",duration: 4.0, position: .top)
                // open address view controller to search location ***************************
                  
            } else {
                dismissKeyboard()
                // post register an order API ***************************
                checkValidationOrderData ()
            }
        }
        return true
    }
}
