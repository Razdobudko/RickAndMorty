//
//  MainViewController.swift
//  RickAndMorty_test
//
//  Created by Veranika Razdabudzka on 15.04.22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var character: Model?
    let xib = "CustomTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.parseJSON { model in
            self.character = model
            self.tableView.reloadData()
        }
        tableView.register(UINib(nibName: xib, bundle: nil), forCellReuseIdentifier: xib)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character?.results.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: xib, for: indexPath) as! CustomTableViewCell
        let result = character?.results[indexPath.row]
        cell.nameLabel.text = result?.name
        cell.genderLabel.text = result?.gender
        cell.speciesLabel.text = result?.species
        return cell
    }
}
