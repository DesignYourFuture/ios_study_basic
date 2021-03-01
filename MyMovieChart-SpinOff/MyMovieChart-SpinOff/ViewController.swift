//
//  ViewController.swift
//  MyMovieChart-SpinOff
//
//  Created by Hamlit Jason on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("\(indexPath.row) is clicked")
    }
}
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // 임의로 5개의 셀 생성
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "return num : \(indexPath.row)"
        
        return cell
    }
    /*
     메인 스토리보드에서 데이터소스와 딜리게이트 부분을 점 세개 있는 거로 연결해야하는데
     컨트롤 누르고 하면 된다.
     데이터 소스를 연결하지 않으면, 넘버오브로우인섹션과 셀포로우엣 메소드를 호출할 수 없어서 테이블 뷰가 만들어지지 않고
     딜리게이트를 연결하지 않으면 테으블 뷰의 모양과 목록은 갖추어 졌더라도, 테이블 뷰에 대한 액션이나 이벤트를 처리할 수 없게된다.
     */
    
}
