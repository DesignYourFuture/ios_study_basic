//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by Hamlit Jason on 2021/02/01.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func moveByNavi(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "secondVC") else {
            return
        }
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    @IBAction func movePresent(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") else {
            return
        }
        
        self.present(uvc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

