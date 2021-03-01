//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by Hamlit Jason on 2021/02/01.
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

    @IBAction func back2(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
