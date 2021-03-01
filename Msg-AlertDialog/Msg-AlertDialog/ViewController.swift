//
//  ViewController.swift
//  Msg-AlertDialog
//
//  Created by Hamlit Jason on 2021/02/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 화면이 완전히 열리기 전이라 여기다 구현하는 것은 적합하지 않다.
    }


    @IBOutlet weak var result: UILabel!
    // 화면이 보이자마자 메시지 뜨게 하려면 이렇게 구현.
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "선택", message: "항목을 선택해 주세여", preferredStyle: .alert)
        //let alert = UIAlertController(title: "선택", message: "항목을 선택해 주세여", preferredStyle: .actionSheet)
        
        
        //  버튼의 내용 생성
        let cancel = UIAlertAction(title: "취소",style: .cancel) { (_) in
            self.result.text = "취소 버튼을 클릭했습니다."
        }
        let ok = UIAlertAction(title : "확인",style: .default){ (_) in
            self.result.text = "오케이 버튼을 클릭했습니다."
        }
        let exec = UIAlertAction(title : "실행",style: .destructive){ (_) in
            self.result.text = "실행 버튼을 클릭했습니다."
        }
        let stop = UIAlertAction(title : "중지",style: .default){ (_) in
            self.result.text = "중지 버튼을 클릭했습니다."
        }
        
        /*
         style에는 값이 3개가 있는데 캔슬을 말그대로 캔슬버튼
         디폴트는 클릭시 아무 이벤트도 일어나지 않음
         디스트럭티브는 빨간색 표시로 글씨 강조.
         */
        
        
        //버튼을 컨트롤러에 틍록
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: false)
    }
    
    @IBAction func alert(_ sender: Any) {
        // 메시지창 객체 생성
        /*
         preferredStyle 따라서 달라지는데, 액션시트나 아니면 alert에 따라서 달라짐
         액션 시트는 다른 부분 클릭할 수 있으나, 알터옵션은 무조건 그 화면을 클릭해야함.
         */
        let alert = UIAlertController(title: "선택", message: "항목을 선택해 주세여", preferredStyle: .alert)
        //let alert = UIAlertController(title: "선택", message: "항목을 선택해 주세여", preferredStyle: .actionSheet)
        
        
        //  버튼의 내용 생성
        let cancel = UIAlertAction(title: "취소",style: .cancel) { (_) in
            self.result.text = "취소 버튼을 클릭했습니다."
        }
        let ok = UIAlertAction(title : "확인",style: .default){ (_) in
            self.result.text = "오케이 버튼을 클릭했습니다."
        }
        let exec = UIAlertAction(title : "실행",style: .destructive){ (_) in
            self.result.text = "실행 버튼을 클릭했습니다."
        }
        let stop = UIAlertAction(title : "중지",style: .default){ (_) in
            self.result.text = "중지 버튼을 클릭했습니다."
        }
        
        /*
         style에는 값이 3개가 있는데 캔슬을 말그대로 캔슬버튼
         디폴트는 클릭시 아무 이벤트도 일어나지 않음
         디스트럭티브는 빨간색 표시로 글씨 강조.
         */
        
        
        //버튼을 컨트롤러에 틍록
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: false)
    }

    @IBAction func login(_ sender: Any) {
        let title = "iTunes Store에 로그인"
        let message = "사용자의 애플 아이디는 입력하세요 여튼간에"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let cancel = UIAlertAction(title: "취소",style: .cancel)
        
        let ok = UIAlertAction(title : "확인",style: .default){ (_) in
            self.result.text = "오케이 버튼을 클릭했습니다."
            
            if let tf = alert.textFields?[0] {
                print("입력된 값은 \(tf.text!) 입니다.")
                self.result.text = tf.text
            } else {
                print("입력된 값이 없습니다.")
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 텍스트 필드 부분
        // 파라미터 컨피규레이션핸들러 없으면 테그테긋트 필드에 아무런 설정도 없다.
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "암호" //안내메시지
            tf.isSecureTextEntry = true // 비밀번호 처리
        })
        
        self.present(alert, animated:false)
    }
    
    @IBAction func auth(_ sender: Any) {
        let msg = "로그인"
        let alert = UIAlertController(title:nil,message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default){ (_) in
            //확인 버튼을 눌렀을 때 실행될 코드
            let loginId = alert.textFields?[0].text
            let loginPw = alert.textFields?[1].text
            
            if loginId == "sqlpro" && loginPw == "1234" {
                self.result.text = "인증되었습니다"
            } else {
                self.result.text = "인증에 실패하셨습니다."
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "아이디" //미리보여줄 안내메시지
            tf.isSecureTextEntry = false
        })
        
        
        // 비밀번호 필드 추가
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "비밀번호"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert,animated:false)
    }
    
    
    
}

