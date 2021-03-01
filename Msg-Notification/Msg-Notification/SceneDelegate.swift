//
//  SceneDelegate.swift
//  Msg-Notification
//
//  Created by Hamlit Jason on 2021/02/06.
//

import UIKit
import UserNotifications
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        NSLog("씬시작")
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    /*
     applicationWillResignActive 이 함수는 앱이 활성화를 잃었을 때 실행되는 메소드는 SMS도착 전화연결 홈 버튼 눌러서 백그라운드로 내리거나 등등
      - ios 13 이상에서 씬으로 변경됨
     우리가 구현한 코드는 앱이 꺼지고나서 몇초 이내에 로컬 알림을 띄워주는 코드
     #available 은 버전에 따라 나누기 위한 코등
     */
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        
        NSLog("f")
        if #available(iOS 10.0, *) { // iOS 10 이상
            NSLog("asd")
            UNUserNotificationCenter.current().getNotificationSettings { // UserNotification 프레임워크를 활용한 로컬 알림 iOS 10.0 이상
                //알림 동의 여부를 확인
                settings in if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    /*
                     사용자가 Allow또는 허락 버튼을 클릭했다면 getNotificationSettings() 메소드의 인자값 클로저에 전달되는
                     settings 객체에서 .autuorizationStatus 속성값은 UNAurhorizationStatus.authorized로 설정됩니다.
                     즉, 로컬알림을 발송할 수 있는 상태이다.
                     */
                    let nContent = UNMutableNotificationContent() // 컨테츠 담을거 생성
                    /*
                     */
                    nContent.badge = 1
                    nContent.title = "로컬 알림 메시지"
                    nContent.subtitle = "준비된 내용이 아주 많아요! 얼른 다시 앱을 열어주세요."
                    nContent.body = "앗? 왜 나갔어요?? 어서 들어오세요"
                    nContent.sound = UNNotificationSound.default
                    nContent.userInfo = ["name":"홍길동"]
                    
                    // 알림 발송 조건 객체
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    // 알림 요청 객체
                    let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                    // 노티피케이션 센터에 추가
                    UNUserNotificationCenter.current().add(request)
                } else {
                    print("사용자가 동의하지 않음")
                }
            }
        } else {
            // iOS 9.0 이하 UILocalNotification 객체를 이용한 로컬 알림
        }
        
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

        
}

