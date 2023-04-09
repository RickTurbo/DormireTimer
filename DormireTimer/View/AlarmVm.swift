//
//  AlarmVm.swift
//  DormireTimer
//
//  Created by 児島　陸斗 on 2022/12/22.
//

import Foundation
import SwiftUI

class AlarmVm:ObservableObject {
//    @StateObject  var timerVm = TimerVm()
   @Published var sleepTimer: Timer?
   @Published var seconds:Int = 0
    var selectedWakeUpTime:Date?
    let musicplayer = SoundPlayer()

    //ここでPickerの元の時間を設定してしまえば良いかも
    @Published var selectionData2 = Date()
    @Published var alarmTime2:String = ""
    @Published var isModal2:Bool = false
    @Published var canTap2: Bool = true

    func runTimer() {
        seconds = calculateInterval(userAwakeTime: selectionData2)

        if sleepTimer == nil {
            sleepTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.updateTimer()
                print("１秒")
                print("\(self.seconds)")
            }
        }
        print("アラームスタート")
    }

//    func updateTimer() {
//        if seconds != 0 {
//            seconds -= 1
//        } else {
//            sleepTimer?.invalidate()
//            sleepTimer = nil
//            print("0になりました")
//            isModal2 = true
//            musicplayer.musicPlayer()
//        }
//    }

    func updateTimer() {
        if seconds != 0 {
            seconds -= 1
        } else {
            self.canTap2 = false
            print("\(self.canTap2)")
            sleepTimer?.invalidate()
            sleepTimer = nil
            print("0になりました")
            musicplayer.musicPlayer()
//            self.isModal2 = true
        }
    }

    func stopTimer(){
        //sleepTimerがnilじゃない場合
        if sleepTimer != nil {
            //タイマーを止める
            sleepTimer?.invalidate()
            //タイマーにnil代入
            sleepTimer = nil
        }else{
            //タイマーを止める
            print("タイマーは止まっている")
            musicplayer.stopAllMusic()
        }
    }

//    func stopTimer() {
//        if let sleepTimer = sleepTimer {
//            sleepTimer.invalidate()
//        } else {
//            print("タイマーを止めた")
//        }
//    }

//    func stopTimer() {
//        if let sleepTimer = sleepTimer {
//            if sleepTimer.isValid == true {
//                sleepTimer.invalidate()
//            }
//        }
//    }


    func calculateInterval(userAwakeTime:Date)-> Int{
        var interval = Int(userAwakeTime.timeIntervalSinceNow)

        if interval < 0{
            interval = 86400 - (0 - interval)
        }

        let calendar =  Calendar.current
        let seconds = calendar.component(.second, from: userAwakeTime)
        return interval - seconds
    }
}
