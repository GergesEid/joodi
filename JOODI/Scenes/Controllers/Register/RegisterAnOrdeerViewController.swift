//
//  ViewController.swift
//  JOODI
//
//  Created by Gerges on 13/04/2021.
//

import UIKit
import ADCountryPicker
import iOSDropDown

class RegisterAnOrdeerViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var viewOfPhoneNo: UIView!
    @IBOutlet weak var viewOfName: UIView!
    @IBOutlet weak var viewOfTime: UIView!
    @IBOutlet weak var viewOfShoppers: UIView!
    @IBOutlet weak var viewOfAddress: UIView!
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryDialCodeLbl: UILabel!
    @IBOutlet weak var viewOfCode: UIView!
    
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var phoneNoTxtField: UITextField!
    @IBOutlet weak var timeTxtField: UITextField!
    @IBOutlet weak var shoppersTxtField: DropDown!
    @IBOutlet weak var addressTxtField: UITextField!
    
    var presenter: RegisterVCPresenter!
    var modelData : ShoppersModel?
    
    var shopperId:Int?
    var dialCodeSaved:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = RegisterVCPresenter(view: self)
        presenter.viewDidLoad()
        
        setDelegate ()
        
        // set ui
        addBorderToViewEmpty(view:viewOfPhoneNo)
        addBorderToViewEmpty(view:viewOfName)
        addBorderToViewEmpty(view:viewOfTime)
        addBorderToViewEmpty(view:viewOfShoppers)
        addBorderToViewEmpty(view:viewOfAddress)
        
        // I write mock address because we need paid Google key
        addressTxtField.text = "I write mock address because we need paid Google key"
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        dismissKeyboard()
        checkValidationOrderData ()
    }
    
    // to open country picker to select code
    @IBAction func dialCodeButton(_ sender: Any) {
        dismissKeyboard()
        getCountryCode ()
    }

}

