//
//  WebViewController.swift
//  prac_Table_webView
//
//  Created by Hamlit Jason on 2021/02/16.
//

import WebKit
import UIKit

class WebViewController : UIViewController {
        
    var dataset : [(String,String)] = []
    var url = ""
    @IBOutlet weak var wv: WKWebView!
    
    var mvo : MovieVO! // 화면에서 전달하는 정보 받으려고
    
    override func viewDidLoad() {
        
        NSLog("ffff\(dataset)")
        NSLog("d\(url)")
        
        let link = URL(string: url) // 객체생성
        let request = URLRequest(url: link!) // 옵셔널 해제해야함
    
        self.wv.load(request)
        // 네이버 링크는 사파리가 아닌 형식으로 할때 ats 문제 발생하는 듯 싶음
    }
    
}
