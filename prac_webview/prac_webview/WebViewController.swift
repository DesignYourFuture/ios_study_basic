//
//  WebViewController.swift
//  prac_webview
//
//  Created by Hamlit Jason on 2021/02/15.
//

import UIKit
import WebKit

class WebViewController : UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {

        let url = URL(string: "https://www.google.com/") // 객체생성
        let request = URLRequest(url: url!) // 옵셔널 해제해야함
    
        self.webView.load(request)
    }
}
