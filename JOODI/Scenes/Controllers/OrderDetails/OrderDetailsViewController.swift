//
//  OrderDetailsViewController.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var shopperLbl: UILabel!
    
    var presenter: OrderDetailsVCPresenter!
    var orderData : OrderDetailsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = OrderDetailsVCPresenter(view: self)
        presenter.viewDidLoad()
    }
    
    @IBAction func dismissBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
