//
//  AppDelegate.swift
//  Msg-Notification
//
//  Created by Hamlit Jason on 2021/02/06.
//

import UIKit
import UserNotifications
/*
 로컬 알림의 4단계
 1. 발송한 내용을 정의 UNMuatableNotificationContent
 2. 발송 조건의 정의 UNTimeIntervalNotificationTrigger
 3. 알림 요청을 만듦 UNNotificationRequest
 4. 노티피케이션 센터에 해당 요청을 등록 UNUserNotificationCenter
 */



@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {


    // 이 메소드는 앞에서 공부했지만, 앱이 제일 처음 실행될때 불리는 메소드다
    /*
     여기 작성한 코드는 앱이 시작될때 동의를 구하는 코드인데, 일반적으로 알림 동의는 앱을 처음 시작할때 받음으로 여기에 작성하기로 한다.
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        NSLog("앱 시작")
        if #available(iOS 11.0, *) {
            // 경고창 배지 사운드를 사용하는 알림 환경 정보를 생성하고, 사용자 동의여부 창을 실행
            let notiCenter =  UNUserNotificationCenter.current()
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (didAllow, e) in }
            notiCenter.delegate = self // 이 코드는 사용자가 알림을 클릭하여 들어온 이벤트를 전달받기 위한 델리게이트 패턴구조
            // 즉, 알림 센터와 관련하여 뭔가 사건이 발생하면 나(앱 델리게이트) 한테 알려줘 이런 의미임
            /* 클로저 매개변수 설명
             사용자가 메시지 창의 알림 동의 여부를 true / false
             오류 발생시 사용하는 오류 발생 타입의 매개변수 e
             */
        } else {
            // 경고창, 배지, 사운드를 사용하는 알림 환경 정보를 생성하고, 이를 애플리케이션에 저장.
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(setting) // 생성된 정보 애플리케이션에 등록
        }
        return true
    }

    /*
     유저노티피케이션센터는 프로토콜이다. 그래서 위에 노티센터.딜리게이트 셀프 이 코드가 있어야 작성가능하다.
     이 메소드는 알림 배너의 표시 여부와 관계없이 알림이 도착하면, 호출된다.
     */
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "wakeup" { // 로컬 알림 등록시 입력한 식별 아이디를 읽어오는 속성
            let userInfo = notification.request.content.userInfo // 유저가 커스텀으로 정의한 정보를 읽어오는 역할
            print(userInfo["name"]!) // 딕셔너리 값을 출력
        }
        // 알림 배너 띄워주기
        completionHandler([.alert, .badge, .sound])
    }
    /*
     앞에서와 비슷하지만, 이 메소드는 실제로 사용자가 알림 메시지를 클릭 했을 경우에 실행된다는 차이를 가짐.
     이떄 알림 메시지에 대한 정보는 모두 위 메소드의 두번쨰 인자값인 response 매개변수에 담겨 전달됩니다.
     */
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "wakeup" { //
            let userInfo = response.notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        completionHandler()
    }
    
    /*
     applicationWillResignActive 이 함수는 앱이 활성화를 잃었을 때 실행되는 메소드는 SMS도착 전화연결 홈 버튼 눌러서 백그라운드로 내리거나 등등
     
     우리가 구현한 코드는 앱이 꺼지고나서 몇초 이내에 로컬 알림을 띄워주는 코드
     #available 은 버전에 따라 나누기 위한 코드
     */
    func applicationWillResignActive(_ application: UIApplication) {
        NSLog("f")
        if #available(iOS 10.0, *) { // iOS 10 이상
            NSLog("asd")
            UNUserNotificationCenter.current().getNotificationSettings { // UserNotification 프레임워크를 활용한 로컬 알림 iOS 10.0 이상
                //알림 동의 여부를 확인
                settings in if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    /*
                     사요잦가 Allow또는 허락 버튼을 클릭했다면 getNotificationSettings() 메소드의 인자값 클로저에 전달되는
                     settings 객체에서 .autuorizationStatus 속성값은 UNAurhorizationStatus.authorized로 설정됩니다.
                     즉, 로컬알림을 발송할 수 있는 상태이다.
                     */
                    let nContent = UNMutableNotificationContent()
                    nContent.badge = 1 // 아이콘 위에 뜨는 숫자
                    nContent.title = "로컬 알림 메시지"
                    nContent.subtitle = "준비된 내용이 아주 많아요! 얼른 다시 앱을 열어주세요."
                    nContent.body = "앗? 왜 나갔어요?? 어서 들어오세요"
                    nContent.sound = UNNotificationSound.default
                    nContent.userInfo = ["name":"홍길동"]
                    /*
                     유저 인포 부분은 화면에 뜨지는 않지만, 로컬 알림과 함께 전달하고 싶은 값이 있을 떄 사용하는 속성
                     일종의 커스텀 형식으로 정의되는 값 - 앱 델리게이트 메소드에서는 참조 가능함.
                     즉, 이 알림을 눌러서 앱 델리게이트에 연결해서 데이터 처리 가능
                     */
                    // 알림 발송 조건 객체
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    // 알림 요청 객체
                    let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                    // 파라미터 - 식별아이디 컨텐츠 트리거
                    // 노티피케이션 센터에 추가
                    UNUserNotificationCenter.current().add(request)
                } else {
                    print("사용자가 동의하지 않음")
                }
            }
        } else {
            // iOS 9.0 이하 UILocalNotification 객체를 이용한 로컬 알림
            // 알림 설정 확인
            let setting = application.currentUserNotificationSettings
            
            guard setting?.types != .none else {
                print("Can't Schedule")
                return
            }
        }
        
        // 로컬 알람 인스턴스 생성
        let noti = UILocalNotification()
        noti.fireDate = Date(timeIntervalSinceNow: 10) // 10초 후 발송
        noti.timeZone = TimeZone.autoupdatingCurrent // 현재 위치에 따라 타임존 설정
        noti.alertBody = "얼릉 다시 접속하세요!!" // 표시될 메시지
        noti.alertAction = "학습하기" // 잠금 상태일 때 표시될 액션
        noti.applicationIconBadgeNumber = 1 // 앱 아이콘 모서리에 표시될 배지
        noti.soundName = UILocalNotificationDefaultSoundName // 로컬 알림 도착시 사운드
        noti.userInfo = ["name" : "홍길동"] // 알람 실행시 함께 전달하고 싶은 값, 화면에는 표시되지 않음
        
        // 생성된 알람 객체를 스케줄러에 등록
        application.scheduleLocalNotification(noti)
        NSLog("로컬 알림 처리 스케줄러")
    }
    
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

