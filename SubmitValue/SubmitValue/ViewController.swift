//
//  ViewController.swift
//  SubmitValue
//
//  Created by Hamlit Jason on 2021/02/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var isUpdate: UISwitch!
    @IBOutlet weak var isUpdateText: UILabel!
    
    @IBOutlet weak var interval: UIStepper!
    @IBOutlet weak var intervalText: UILabel!
    
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if(sender.isOn == true) { // sender를 통해 스위치 컨트롤 자체가 전달된다.
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) { // 스테퍼 컨트롤도 센더를 통해 전달된다.
        let value = Int(sender.value) // 스테퍼의 값을 읽어오기
        /*
         스테퍼의 값은 실수형이다. 또한 현재 저장된 값을 저장한다.
         */
        self.intervalText.text = "\(value)분 마다"
    }
    
    /* 만약 any타입으로 선언되었다면 ...
     
     @IBAction func onSwitch(_ sender: Any) {
        // 옵셔널 캐스팅
        guard let obj = sender as? UISwitch else {
            return
        }
     

         if(obj.isOn == true) { // sender를 통해 스위치 컨트롤 자체가 전달된다.
             self.isUpdateText.text = "갱신함"
         } else {
             self.isUpdateText.text = "갱신하지 않음"
         }
     }
     
     @IBAction func onStepper(_ sender: Any) { // 스테퍼 컨트롤도 센더를 통해 전달된다.
     //강제 캐스팅
        let obj = sender as! UIStepper
     let value = Int(obj.value) // 스테퍼의 값을 읽어오기
     
     
         /*
          스테퍼의 값은 실수형이다. 또한 현재 저장된 값을 저장한다.
          */
         self.intervalText.text = "\(value)분 마다"
     }
     */
    
    /*
     뷰 컨트롤을 세그웨이로 싸용하면 prepare을 사용하여 값을 전달해야한다.
     인스턴스를 생성하면 에러가 난다.
     */
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 목적지 뷰 컨트롤러 인스턴스 읽어오기
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else {
            return
        }
        
        // 값 전달
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
    }
    
    
    
    @IBAction func onSubmit(_ sender: Any) {
        // VC2의 인스턴스 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
        }
        
        //self 쓰는 이유는 같은 컨트롤러에 값을 가져올 때! 근데 안써도 값은 똑같아
        rvc.paramEmail = self.email.text! // 이메일
        rvc.paramUpdate = self.isUpdate.isOn // 자동갱신 여부
        rvc.paramInterval = self.interval.value // 갱신주기
        
        /* 화면이동
        self.present(rvc, animated: true)
        */
        
        // 네비게이션 화면이동
        self.navigationController?.pushViewController(rvc, animated: true)
        
        //
        
        // 값을 전달하는 과정을 여기에 작성
        NSLog("sad")
    }
}

