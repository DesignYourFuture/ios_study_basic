//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by Hamlit Jason on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultEmail: UILabel!
    @IBOutlet weak var resultUpdate: UILabel!
    @IBOutlet weak var resultInterval: UILabel!
    
    var paramEmail : String?
    var paramUpdate : Bool?
    var paramInterval : Double?
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }

  
    // 화면에 표시될 때마다 실행되는 메소드
        override func viewWillAppear(_ animated: Bool) {
            if let email = paramEmail {
                resultEmail.text = email
            }
            if let update = paramUpdate {
                resultUpdate.text = update==true ? "자동갱신":"자동갱신안함"
            }
            if let interval = paramInterval {
                resultInterval.text = "\(Int(interval))분마다"
            }
            NSLog("gg")
        }
    
}

