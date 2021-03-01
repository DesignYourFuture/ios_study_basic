//
//  ListViewController.swift
//  prac_Table_webView
//
//  Created by Hamlit Jason on 2021/02/16.
//

import UIKit
import SafariServices
import WebKit

class ListViewController : UITableViewController {
    
    
    
    var dataset = [
        ("asd","https://www.google.com"),
        ("bbb","https://www.naver.com"),
        ("vvv","http://www.konkuk.ac.kr/do/Index.do")
    
    ]
    
    var passUrl = ""
    
    lazy var list : [MovieVO] = {
        var datalist = [MovieVO]()
        
        for (title,url) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.url = url
            
            datalist.append(mvo)
        }
        
        return datalist
    }()
    
    override func viewDidLoad() {
        NSLog("mmmm\(self.dataset.count)")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        let fir = cell.viewWithTag(101) as? UILabel
        let sec = cell.viewWithTag(102) as? UILabel
        let thr = cell.viewWithTag(103) as? UILabel
        
        fir?.text = row.title
        sec?.text = "123"
        thr?.text = "gg"
        
        //cell.textLabel?.text = row.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 120
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        NSLog("\(indexPath.row) : \(self.dataset[indexPath.row])")
        
        /* 사파리로 여는 코드
        var link = self.dataset[indexPath.row].1
        print(link)
        let url = URL(string: link)
        UIApplication.shared.open(url!,options: [:])
        */
        
        // 값을 전달할 웹뷰 컨트롤러 객체 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? WebViewController else {
            return
        }
        rvc.dataset = self.dataset
        rvc.url = dataset[indexPath.row].1
        
        //self.present(rvc,animated: true)
        self.navigationController?.pushViewController(rvc, animated: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        guard let rvc = dest as? WebViewController else { return }
        
        
        
    }
    
    
}
