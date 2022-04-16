//
//  DetailViewController.swift
//  RickAndMorty_test
//
//  Created by Veranika Razdabudzka on 16.04.22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    var model: Results?
    let defaultImage = "https://rickandmortyapi.com/api/character/avatar/19.jpeg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = model?.name
        speciesLabel.text = model?.species
        genderLabel.text = model?.gender
        statusLabel.text = model?.status
        locationLabel.text = model?.location.name
        
        let count = model?.episode.count ?? 1
        episodeLabel.text = "\(count)"
        
        imageDetail.downloaded(from: model?.image ?? defaultImage)
    }
}
