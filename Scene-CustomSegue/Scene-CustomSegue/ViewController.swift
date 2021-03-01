//
//  ViewController.swift
//  Scene-CustomSegue
//
//  Created by Hamlit Jason on 2021/02/01.
//

import UIKit

/*
 커스텀 + prepare인데
 프리페어가 개발자들이 더 많이 사용함.
 그 이유는 자유롭게 컨트롤 가능하고, 막상 써보니까 더 유연해서 사용하면 더 강력할 것 같다는 생각이 들었다
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("세그웨이가 곧 실행됩니다.")
        
        if (segue.identifier == "custom") {
            NSLog("커스텀 곧 실행됩니다.")
        } else if (segue.identifier == "action") {
            NSLog("액션 곧 실행됩니다.")
        }
        
    }

}

