//
//  DetailViewController.swift
//  foodpin
//
//  Created by 張宸瑋 on 2021/11/8.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var restaurantImageView: UIImageView!

    var restaurantImageName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantImageView.image = UIImage(named: restaurantImageName)
        
        // Do any additional setup after loading the view.
    }
    
 

    



}
