//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by Hamlit Jason on 2021/02/05.
//

import UIKit
class FormViewController : UIViewController {
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var isUpdate: UISwitch!
    @IBOutlet weak var interval: UIStepper!
    
    @IBOutlet weak var isUpdateText: UILabel!
    @IBOutlet weak var intervalText: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
    }
    

    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }

    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음, ViewController 타입으로 캐스팅한다.
                let preVC = self.presentingViewController
                guard let vc = preVC as? ViewController else {
                    NSLog("ASD")
                    return
                }
                // 값을 전달한다.
                vc.paramEmail = self.email.text
                vc.paramUpdate = self.isUpdate.isOn
                vc.paramInterval = self.interval.value
                NSLog("22")
                // 이전 화면으로 복귀한다.
                self.presentingViewController?.dismiss(animated: true)
    }
}
