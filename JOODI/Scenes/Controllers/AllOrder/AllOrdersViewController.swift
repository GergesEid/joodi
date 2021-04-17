//
//  AllOrdersViewController.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import UIKit

class AllOrdersViewController: UIViewController {

    @IBOutlet weak var allOrdersTableView: UITableView!
    
    var presenter: AllOrdersVCPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = AllOrdersVCPresenter(view: self)
        presenter.viewDidLoad()
    }
    
}
