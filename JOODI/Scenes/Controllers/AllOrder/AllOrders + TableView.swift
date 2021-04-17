//
//  AllOrders + TableView.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import UIKit

extension AllOrdersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        allOrdersTableView.dataSource = self
        allOrdersTableView.delegate = self
        allOrdersTableView.register(UINib(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "OrdersTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getOrdersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allOrdersTableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell", for: indexPath) as! OrdersTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(index: indexPath.row)
    }
    
}
