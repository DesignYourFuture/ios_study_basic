//
//  ViewController.swift
//  Delegate-TextFeild
//
//  Created by Hamlit Jason on 2021/02/08.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /* 키보드 타입 및 안내 메시지 설정
         만약 키보드가 안뜨면 시뮬레이터 - I/O - 키보드에서 하드웨어 부분 체크 해제*/
        self.tf.placeholder = "값을 입력하세요" // 안내 메시지
        self.tf.keyboardType = UIKeyboardType.alphabet // 키보드 타입 영문자 패드로
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark // 어둡게
        self.tf.returnKeyType = UIReturnKeyType.join // 리턴키 타입은 조인
        self.tf.enablesReturnKeyAutomatically = true // 리턴키 자동 활성화
        
        //스타일 설정
        
        
        self.tf.borderStyle = UITextField.BorderStyle.line // 테두리 스타일
        self.tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0) // 배경 색상
        self.tf.contentVerticalAlignment = .center // 수직 방향으로 텍스트가 가운데 정렬되도록
        self.tf.contentHorizontalAlignment = .center // 수평 방향으로 텍스트가 가운데 정렬되도록
        self.tf.layer.borderColor = UIColor.darkGray.cgColor // 테두리 색상을 회색으로
        self.tf.layer.borderWidth = 2.0 // 테두리 두깨 설정 (단위 : pt)
        
        /*
         iOS에서 색상 처리는 보통 UIColor이지만
         텍스트 필드의 테두리 색상은 그보다 저수준에서 구현된 CGColor 사용함.*/
        
        
        self.tf.becomeFirstResponder() //텍스트 필드를 최초 응답자로 지정
        
        self.tf.delegate = self // 델리게이트 지정
        /*
         텍스트 필드의 delegate는 텍스트 필드에 특정 이벤트가 발생했을 때 알려줄 대상 객체를 가르키는 속성
         이 속성에 대입된 self는 현재의 뷰 컨트롤러 인스턴스를 의미
         텍스트 필드에서 미리 정해진 특정 이벤트가 발생하면 현재의 뷰 컨트롤러에게 알려달라는 요청이다.
         이를 가르켜 뷰 컨트롤러가 텍스트 필드의 델리게이트 객체로 지정되었다 라고 표현한다.
         
         텍스트 필드가 자신의 델리게이트 객체에게 특정 이벤트가 발생했음을 알려줄 때에는 델리게이트 메소드를 이용합니다. 이벤트마다 호출하기로 약속된 메소드가 정해져 있는데, 이를 현재 지정된 델리게이트 객체에서 찾아 호출하는 겁니다. 이를 위해서는 먼저 델리게이트 객체에 지정된 메소드가 구현되어있는지 확인하고 구현되어 있다면 필요한 이자값을 담아 메소드를 호출하고 그렇지 않다면 안알려 줘도 되나보다라고 판단하고 그대로 종료하는 방식으로 이루어지는 것이 델리게이트 패턴입니다.
         
         컨트롤 + 시프트 + 0 : 다큐먼트 참고
         */
    }


    @IBOutlet weak var tf: UITextField!
    
    @IBOutlet weak var switchbtn: UISwitch!
    
    @IBAction func confirm(_ sender: Any) {
        self.tf.resignFirstResponder() // 텍스트 필드를 최초 응답자 객체에서 해제
    }
    
    @IBAction func input(_ sender: Any) {
        self.tf.becomeFirstResponder() // 텍스트 필드를 최초 응답자 객체로 지정
        /*
         이 코드의 의미는 텍스트 필드를 터치하지 않고도 버튼을 클릭하면 텍스트 필드가 입력 대기 상태가 되도록 만들어 보는것.
         */
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // 이 함수는 텍스트 필드의 편집을 시작할 때 자동 호출
        print("텍스트 필드의 편집이 시작됩니다.")
        return true // false를 리턴하면 편집되지 않는다.
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // 텍스트 필드를 삭제할 때 자동 호출된다.
        print("텍스트 필드의 내용이 삭제됩니다.")
        return true // false를 리턴하면 삭제되지 않는다.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 텍스트 필드의 내용이 변경될 때 호출
        print("텍스트 필드의 내용이 \(string)로 변경됩니다")
        
        if switchbtn.isOn == false { // 버튼 끄면 입력을 막음
            return false
        } else if Int(string) == nil { // if문은 텍스트 필드에 숫자 입력을 막기 위한 코드
            
            if (textField.text?.count)! + string.count > 10 { // 현재 텍스트 필드에 입력된 길이와 더해질 문자열 길이의 합이 10을 넘는다면 반영하지 않음.
                return false
            } else {
                return true // false를 리턴하면 내용이 변경되지 않는다.
            }
            
        } else {
            return false // false를 리턴하면 내용이 변경되지 않는다.
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 텍스트 필드의 리턴키가 눌러졌을 때 호출
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다")
        return true // false를 리턴하면 내용이 변경되지 않는다.
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // 텍스트 필드의 편집이 종료될 때 호출
        print("텍스트 필드의 편집이 종료됩니다")
        return true // false를 리턴하면 내용이 변경되지 않는다.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 텍스트 필드의 편집이 종료되었을 때 호출
        print("텍스트 필드의 편집이 종료되었습니다.")
        
    }
}

