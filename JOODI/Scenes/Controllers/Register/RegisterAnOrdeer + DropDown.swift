//
//  RegisterAnOrdeer + DropDown.swift
//  JOODI
//
//  Created by Gerges on 15/04/2021.
//

import Foundation

extension RegisterAnOrdeerViewController {
    func setDropDown ()  {
        // The list of array to display. Can be changed dynamically
        shoppersTxtField.optionArray = ["Employee 1","Employee 2","Employee 3","Employee 4","Employee 5","Employee 6"]
        // Its Id Values and its optional
        shoppersTxtField.optionIds = [1,2,3,4,5,6]
        
        // The the Closure returns Selected Index and String
        shoppersTxtField.didSelect{(selectedText , index ,id) in
            print("Selected String: \(selectedText) , index: \(index) , id: \(id)")
            self.shopperId = id
        }
    }
}
