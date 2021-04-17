//
//  RegisterAnOrderExtension + ADCountryPickerDelegate.swift
//  JOODI
//
//  Created by Gerges on 13/04/2021.
//

import Foundation
import ADCountryPicker

extension RegisterAnOrdeerViewController: ADCountryPickerDelegate {
    
    // open country picker to get code and image of country
    func getCountryCode () {
        let picker = ADCountryPicker(style: .grouped)
        // delegate
        picker.delegate = self
        // Display calling codes
        picker.showCallingCodes = true
        /// The nav bar title to show on picker view
        picker.pickerTitle = "Select Country"
        /// The default current location, if region cannot be determined. Defaults to Iraq
        picker.defaultCountryCode = "IQ"
        // or closure
        picker.didSelectCountryClosure = { name, code in
            _ = picker.navigationController?.popToRootViewController(animated: true)
            print(code)
        }
        //        Use this below code to present the picker
        let pickerNavigationController = UINavigationController(rootViewController: picker)
        self.present(pickerNavigationController, animated: true, completion: nil)
    }
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        _ = picker.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        countryDialCodeLbl.text = dialCode
        phoneNoTxtField.becomeFirstResponder()
        let flagImage =  picker.getFlag(countryCode: code)
        
        countryImage.image = flagImage
        dialCodeSaved = dialCode
        
        UserDefaults.standard.setValue(dialCode, forKey: "dialCode")
        
    }
}
