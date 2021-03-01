//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by Hamlit Jason on 2021/02/09.
//

import UIKit

class ListViewController : UITableViewController {
    
    // 테이블 뷰를 구성할 리스트 데이터
    //var list = [MovieVO]()
    
    override func viewDidLoad() {
        /*
        var mvo = MovieVO() // 첫번째 행
        mvo.title = "dark night"
        mvo.descriptions = "영웅물에 철학에 음악끼지! 더해져 예술이 되다."
        mvo.opendate = "2008-09-04"
        mvo.rationg = 8.95
        
        self.list.append(mvo) // 배열에 추가
    
        mvo = MovieVO() // 두번째 행
        /*
         새로운 값을 대입하기 위해선 기존 값을 지우고 덮어쓴 다음 재사용
         만약, mvo = MovieVO()하지 않는다면, 이미 list 배열에 저장된 모든 값들도 함께 변경되는 문제가 발생한다
         즉, 저장된다고 해서 끝이 아닌거다.
         */
        mvo.title = "호우 시절"
        mvo.descriptions = "때를 알고 내리는 좋은 비"
        mvo.opendate = "2009-10-08"
        mvo.rationg = 7.31
        
        self.list.append(mvo) // 배열에 추가
        
        mvo = MovieVO() // 세번째 행
        mvo.title = "말할 수 없는 비밀"
        mvo.descriptions = "여기서 너까지 다섯 걸음"
        mvo.opendate = "2015-05-07"
        mvo.rationg = 9.19
        
        self.list.append(mvo) // 배열에 추가
        */
    }
    
    
    /*
     리팩토링 - 뷰디드 로드에 작성한 코드를 이렇게 작성하여 유지보수 향상
     */
    // 튜플 아이템으로 구성된 데이터 세트
    
    var dataset = [
        ("dark night","예술이되다","2008-09-04", 8.95, "darknight.jpg"),
        ("호우 시절","좋은 비","2009-10-08",7.31, "rain.jpg"),
        ("말할 수 없는 비밀","여기서 너까지 다섯 걸음","2015-05-07",9.19, "secret.jpg")
    ]
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list : [MovieVO] = { // lazy - 참조되는 시점에 맞추어 초기화되므로 메모리 낭비 줄인다.
        var datalist = [MovieVO]()
        for (title,desc,opendate,rating,thumbnail) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.descriptions = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            
            datalist.append(mvo)
        }
        return datalist
    }()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 메소드를 구현하고, 생성할 목록의 길이를 반환한다
        // 행의 갯수 반환
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {// 행의 갯수만큼 반복되는 메소드
        
        let row = self.list[indexPath.row] // 주어진 행에 맞는 데이터 소스를 읽어온다
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell // 테이블 셀 객체를 직접 생겅하는 대신 큐로부터 가져옴
        // identifier : listcell은 스토리보드의 셀의 아이디다
        // 또한 ReusableCell라는 객체가 관여하는데 셀 인스턴스가 폐기되지 입력된 아이디에 맞는 인스턴스가 셀에 있다면 재사용하고 없다면 새로 생성 생성하여 제공
        // 재사용하는 이유는 - 우리는 100개의 행을 만든다고 생각하지만 실제로는 메모리와 배터리 절약을 위해 이렇게 재사용
        //cell.textLabel?.text = row.title // 텍스트 레이블은 스토리보드의 타이틀 부분에 해당하는 것이다. 그러나 베이직이 아닌 다른 옵션을 사용하면 다른 함수인데 그건 디테일텍스트레이블이다
        // ?를 붙이는 이유는 값이 있으면 하위 속성은 .text를 처리하고 없으면 아무것도 하지 않는다는 의미
        
        //cell.detailTextLabel?.text = row.descriptions // 서브 타이틀에 연결
        
        
        
        /*
         여기 부터는 커스텀 셀로 태그 값 주어서 연결한 것
         태그 값이 아닌 아울렛 변수로 하는건 아울렛 변수가 정적이라 리스트에서 에러남
         */
        
        // 각 레이블을 받는다.
        //let title = cell.viewWithTag(101) as? UILabel
        //let desc = cell.viewWithTag(102) as? UILabel
        //let opendate = cell.viewWithTag(103) as? UILabel
        //let rating = cell.viewWithTag(104) as? UILabel
        
        // 데이터 소스에 저장된 각 레이블 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.title
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // 테이블 셀을 클릭하거나 터치했을 때 액션을 처리하기 위한 메소드임
        NSLog("row is \(indexPath.row)")
    }
}
