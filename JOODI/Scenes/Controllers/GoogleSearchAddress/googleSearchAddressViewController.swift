//
//  googleSearchAddressViewController.swift
//  JOODI
//
//  Created by Gerges on 16/04/2021.
//

import UIKit

class googleSearchAddressViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableV: UITableView!
    @IBOutlet weak var viewOfAddress: UIView!
    
    var str = ""
    var resultsArray : [Dictionary<String , AnyObject>] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        setAddressUI ()
    }
    
    // set ui
    func setAddressUI () {
        textField.addTarget(self, action: #selector(searchPlaceFromGoogle(_ :)), for: .editingChanged)
        tableV.estimatedRowHeight = 44.0
        textField.becomeFirstResponder()
        viewOfAddress.layer.cornerRadius = 30
        // we need paid Google key to get resaults
        textField.text = "we need paid Google key to get resaults"
    }
        
    @IBAction func XACTION(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dimissBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

