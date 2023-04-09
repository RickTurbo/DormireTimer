//
//  DormireTimerApp.swift
//  DormireTimer
//
//  Created by 児島　陸斗 on 2022/12/03.
//

import SwiftUI
import GoogleMobileAds

@main
struct DormireTimerApp: App {
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TimerVm())
                .environmentObject(AlarmVm())
        }
    }
}
