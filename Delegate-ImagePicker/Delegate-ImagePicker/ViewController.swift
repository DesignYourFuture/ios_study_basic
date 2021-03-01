//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by Hamlit Jason on 2021/02/09.
//

import UIKit
/*
 선택한 이미지를 받아 표현할 수 있도록 델리게이트 메소드 구현해야한다.
 */
class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var ImgView: UIImageView!
    
    @IBAction func pick(_ sender: Any) {
        //이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능 on
        
        picker.delegate = self // 델리게이트 지정
        
        self.present(picker, animated: false)
    }
}
// 익스텐션 할용해서 프로토콜을 여디가 구현해 코드의 깔끔함을 더한다.
// MARK:- 익스텐션 활용
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
        picker.dismiss(animated: false, completion: {() in
            
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        })
        // 이미지 피커 컨트롤러와 알림창 둘다 뷰컨트롤러에서 사용하는 것이라서
        // 미묘한 타이밍 차이에 따라 충돌문제가 발생할 수 있어서
        // 디스미스의 컴플리션으로 구현하여 완료한 후 실행할 수 있도록 한다.
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지 피커에서 이미지를 선택했을 때 호출되는 메소드
        
        
        picker.dismiss(animated: false) { () in // 위의 컴플리션 쓰는거랑 같은 의미의 코드다 - 트레일링 클로저 문법
            
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage // 이미지 불러오는 법
            self.ImgView.image = img
        }
    }
   /*
     이미지 선택시 로직
     1. 이미지피커 컨트롤러 닫으면서
     2. 딕셔너리 타입으로 정의된 매개변수 info에는 사용자가 선택한 이미지 정보가 담겨서 전달된다.
     3. 이미지 관련키를 사용해 원하는 이미지 정보를 추출할 수 있다.
     4. 이를 위해 UIImagePickerController의 UIImagePickerController 상수값이 사용되었다.
     5. 읽어온 값은 이미지 데이터를 담고 있지만 아직 범용 객체인 any 타입이라 UIImage타입으로 캐스팅한 다음에야 이미지 객체로 활용할 수 있는 상태가 된다.
     6. 이렇게 추출된 이미지에 .image 속성에 대입하면 처리과정은 끝.
     */
    
}

