//
//  RegisterAnOrdeerViewController + CheckValidPost.swift
//  JOODI
//
//  Created by Gerges on 16/04/2021.
//

import UIKit
 
extension RegisterAnOrdeerViewController {
    // check vaild data for register order
    func checkValidationOrderData () {
        guard let userName = nameTxtField.text , !userName.isEmpty else {
            self.view.makeToast("Please enter your name",duration: 4.0, position: .center)
            addBorderToViewError(view:viewOfName)
            nameTxtField.becomeFirstResponder()
            return
        }
                
        guard let phoneNumber = phoneNoTxtField.text , !phoneNumber.isEmpty , phoneNumber.count >= 8 else {
            informUserError ()
            phoneNoTxtField.becomeFirstResponder()
            return
        }
        
        let validMobile = isValidNumber(testStr: phoneNoTxtField.text ?? "" )
        if validMobile {
        } else {
            informUserError ()
            phoneNoTxtField.becomeFirstResponder()
            return
        }
        
        guard let time = timeTxtField.text else {
            return
        }
        
        guard let address = addressTxtField.text , !address.isEmpty else {
            self.view.makeToast("Please enter your address to deliver your order",duration: 4.0, position: .center)
            openSearchAddress ()
            return
        }
        
        // The data are valid now so we post data to server
        presenter.postAnOrder(name: userName, phone: "\(dialCodeSaved ?? "+965")\(phoneNumber)", time: time, shopperId: shopperId ?? 0, location: address)
    }
}
