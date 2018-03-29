//
//  CoffeeCell.swift
//  CoffeeMix
//
//  Created by Sercan Burak AĞIR on 22.03.2018.
//  Copyright © 2018 Sercan Burak AĞIR. All rights reserved.
//

import UIKit


class CoffeeCell: UITableViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var coffeeImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var coffeeImageTopConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func configureCell(coffee: Coffee?){
        guard let coffeeText = coffee?.name, let coffeImage = coffee?.coffeeImage else { return }
        coffeeNameLabel.text = coffeeText
        coffeeImageView.loadImagesUsingCacheWithUrlString(urlString: coffeImage)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        selectedBackgroundView?.backgroundColor = selected ? .clear : .red
    }
    
    func setupCell(){
        coffeeImageView.layer.cornerRadius = 15
        coffeeImageView.clipsToBounds = true
        
        shadowView.layer.cornerRadius = 15
        shadowView.layer.shadowOpacity = 0.55
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowRadius = 8
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 8)
    }
}
