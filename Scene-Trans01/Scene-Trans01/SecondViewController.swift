//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by Hamlit Jason on 2021/01/31.
//

import UIKit

class SecondViewController: UIViewController {


    
    @IBAction func backbtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
