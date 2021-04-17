//
//  RegisterAnOrdeerVC + ShowSuccesAlert.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation

extension RegisterAnOrdeerViewController {
    // action after send data to the server successfully
    func showAlertAndClearData () {
        self.view.makeToast("You order sent successfully, Thanks for your order",duration: 6.0, position: .center)
        nameTxtField.text = ""
        phoneNoTxtField.text = ""
        timeTxtField.text = ""
        shoppersTxtField.text = ""
        shopperId = 0
        addressTxtField.text = ""
    }
}
