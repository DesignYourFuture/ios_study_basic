//
//  NewSeque.swift
//  Scene-CustomSegue
//
//  Created by Hamlit Jason on 2021/02/01.
//

import UIKit

class NewSegue : UIStoryboardSegue {
    
    override func perform() {
        // 세그웨이의 출발지의 뷰
        let srcUVC = self.source
        // 세그웨이의 도착지의 뷰
        let destUVC = self.destination
        // 프롬에서 투로 뷰 전환
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
        /* 파라미터
         시작
         도착
         걸리는 시간
         애니메이션 전환 옵션
         컴플리션 : 화면 전환 끝난 후 실행될 클로저 구문
         
         */
    }
}
