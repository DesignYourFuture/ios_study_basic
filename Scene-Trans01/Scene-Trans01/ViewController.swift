//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by Hamlit Jason on 2021/01/31.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func moveNext(_ sender: Any) {
        let uvc = self.storyboard!.instantiateViewController(identifier: "secondVC")
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        
        self.present(uvc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

