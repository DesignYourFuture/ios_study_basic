//
//  ListViewController.swift
//  Table-CellHeight
//
//  Created by Hamlit Jason on 2021/02/11.
//

import UIKit

class ListViewController : UITableViewController {
    
    var list = [String]() // 테이블 뷰에 연결된 데이터를 저장하는 배열
    @IBAction func add(_ sender: Any) {
        
        let alert = UIAlertController(title: "목록입력", message: "추가될 글을 작성해주세요", preferredStyle: .alert)
        
        // 알림창에 입력폼 생성
        alert.addTextField() { (tf) in
            tf.placeholder = "내용을 입력하세요"
        }
        
        // 버튼 객체 생성 - 등록은 아직 되지 않은 상태
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            if let title = alert.textFields?[0].text {
                self.list.append(title)
                self.tableView.reloadData() // 배열에 입력된 값을 추가하고 갱신
            }
        }
    
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert,animated: false)
    }
    
    // 뷰의 가로 행 수를 결정하는
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell이라는 아이디를 가진 셀을 읽어온다. 없으면 UITableViewCell 인스턴스를 생성한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        /*
          A ?? B
         만약 A가 nil이 아닐경우 옵셔널을 해제하고 nil이면 B값을 대신 사용해라.
         
         즉, "cell" 아이디를 가진 쉘을 읽어와 옵셔널을 헤제하되, 만약 그 값이 nil일 경우 UITableViewCell 인스턴스를 새로 생성한다.
         */
        
        // 셀의 기본 텍스트 레이블 행 수 제한을 없앤다.
        cell.textLabel?.numberOfLines = 0
        
        // 셀의 기본 텍스트를 레이블에 배열 변수의 값을 할당한다.
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50 // 대충의 높이값
        /*
         estimatedRowHeight 프로퍼티는 셀 전체의 높이를 결정하기 전에 임시로 사용할 셀의 높이 값을 나타낸다
         UITableView.automaticDimension 객체는 테이블 뷰의 rowHeight 속성에 대입되어 높이 값이 동적으로 설정될 것을 테이블 뷰에 알려주는 역할을 한다.
         
         */
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    /*
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let row = self.list[indexPath.row]
        
        // 높이를 조절해준다. 기본 높이 60 + 글의 길이가 30자를 넘어갈 때마다 20만큼씩 높이를 늘려준다.
        let height = CGFloat(60 + (row.count / 30) * 20)
        return height
    }
     */
}
