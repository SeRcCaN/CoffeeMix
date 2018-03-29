//
//  DetailViewController.swift
//  CoffeeMix
//
//  Created by Sercan Burak AĞIR on 23.03.2018.
//  Copyright © 2018 Sercan Burak AĞIR. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedCoffee: Coffee!
    
    @IBOutlet weak var dismissView: UIVisualEffectView!
    @IBOutlet weak var selectedCoffeeImageView: UIImageView!
    @IBOutlet weak var materialTextView: UITextView!
    @IBOutlet weak var preparationTextView: UITextView!
    
    @IBOutlet weak var imageViewHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var prepareTextViewTopConstraints: NSLayoutConstraint!
    @IBOutlet weak var materialTextViewTopConstraints: NSLayoutConstraint!
    @IBOutlet weak var prepareLblTopConstraints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(dismissVC(sender:)))
        swipe.direction = .down
        selectedCoffeeImageView.addGestureRecognizer(swipe)
    }
}

//MARK: - UITextViewDelegate

extension DetailViewController: UITextViewDelegate{
    //UITexView Dynamic Height
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
    }
}

//MARK: - UI Extension

extension DetailViewController{
    func setupUI(){
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            if UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE {
                imageViewHeightConstraints.constant = 200
                prepareTextViewTopConstraints.constant = 0
                materialTextViewTopConstraints.constant = 0
                prepareLblTopConstraints.constant = 0
            }else {
                imageViewHeightConstraints.constant = 310
                prepareTextViewTopConstraints.constant = 10
                materialTextViewTopConstraints.constant = 10
                prepareLblTopConstraints.constant = 15
            }
        case .pad:
            imageViewHeightConstraints.constant = 450
            prepareTextViewTopConstraints.constant = 10
            materialTextViewTopConstraints.constant = 10
            prepareLblTopConstraints.constant = 15
        default:
            print("Default Case")
        }
        
        guard let coffee = selectedCoffee else { return }
        selectedCoffeeImageView.loadImagesUsingCacheWithUrlString(urlString: coffee.coffeeImage!)
        materialTextView.text = coffee.material
        preparationTextView.text = coffee.preparation
        dismissView.layer.cornerRadius = 10
        dismissView.clipsToBounds = true
    }
    
    @IBAction func closeDetailVC(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissVC(sender: UISwipeGestureRecognizer){
        if sender.direction == .down{
            dismiss(animated: true, completion: nil)
        }
    }
}
