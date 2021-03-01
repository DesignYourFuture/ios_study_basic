//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by Hamlit Jason on 2021/02/02.
//

import UIKit

class ResultViewController : UIViewController {
    
    override func viewDidLoad() {
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }
    // 화면에 값을 표시하는데 사용될 레이블
    @IBOutlet weak var resultEmail: UILabel!
    @IBOutlet weak var resultUpdate: UILabel!
    @IBOutlet weak var resultInterval: UILabel!
    /*
     아울렛 변수는 값을 외부에서 대입할 수 없는 변수
     따라서 아래 코드처럼 변수를 선언해서 넣어주어야 한다.
     */
    // email 값을 받을 변수
    var paramEmail : String = ""
    // update 값을 받을 변수
    var paramUpdate : Bool = false
    // Interval 값을 받을 변수
    var paramInterval : Double = 0
    
    
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
        // 프레젠테이션 방식으로 전환하였을 때, 돌아가는 코드.
    }
}
