//
//  ViewController.swift
//  prac_webview
//
//  Created by Hamlit Jason on 2021/02/15.
//

import UIKit
import WebKit
import SafariServices
/*
 내가 공부용으로 만든 웹뷰 - 여기서 중요한 점은 한번 코드를 짜두면 여러번 이용할 수 있게끔 항상 고민하기
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openbtn(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(identifier: "rvc") else {
            return
        }
        
        self.present(rvc, animated: true)
    }
    
    @IBAction func safaribtn(_ sender: Any) {
        // 사파리 사용은 간단하다, 그러나 사파리 앱을 통해 연결된다는 것이 약간은 차이점이라고 볼 수 있다.
        let url = URL(string: "https://www.google.com")
        let safariViewController = SFSafariViewController(url: url!)
        
        present(safariViewController, animated: true)
    }
    @IBAction func seguebtn(_ sender: Any) {
        
    }
}

