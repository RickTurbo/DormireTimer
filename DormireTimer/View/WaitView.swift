//
//  WaitView.swift
//  DormireTimer
//
//  Created by 児島　陸斗 on 2022/12/03.
//

import SwiftUI

struct WaitView: View {
    let now = Date()
    let dateFormatter = DateFormatter()
    let dateFormatter2 = DateFormatter()
//    @EnvironmentObject var timerVm:TimerVm
    @Environment(\.dismiss) var dismiss
    @State var isModal:Bool = false
    @Environment(\.presentationMode) var presentation
    @StateObject var alarmVm = AlarmVm()
    @EnvironmentObject var alarmVm2: AlarmVm
    let musicplayer = SoundPlayer()
    let AdMobID: String = "ca-app-pub-7803037430770004/9076802256"

    init() {
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
        dateFormatter2.dateFormat = DateFormatter.dateFormat(fromTemplate: "Hm", options: 0, locale: Locale(identifier: "ja_JP"))
    }
    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            VStack(alignment:.center){
                VStack(alignment: .trailing) {
                    Text("アラーム待機画面")
                        .font(.title)
                        .fontWeight(.heavy)
                    Text(dateFormatter.string(from: now))
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding()
                    Text(dateFormatter2.string(from: now))
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding()
                }
                VStack(alignment:.center) {
                    Text("アラーム設定")
                        .fontWeight(.bold)
                        .padding()
                        .font(.title)

//                    Text(timerVm.alarmTime)
                    Text(alarmVm2.alarmTime2)
                        .fontWeight(.heavy)
                        .font(.title)
                        .scaleEffect(x: 2, y: 2)
                    Spacer()

                    Button(action: {
                        alarmVm.isModal2 = true
                    }) {
                        Text("仮")
                            .font(.largeTitle)
                            .frame(width: 200,height: 80)
                            .background(Color.yellow)
                            .foregroundColor(Color.white)
                            .cornerRadius(15, antialiased: true)
                    }
                    .fullScreenCover(isPresented: $alarmVm.isModal2) {
                        SleepView()
                    }

                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("キャンセル")
                            .font(.largeTitle)
                            .frame(width: 200,height: 80)
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(15, antialiased: true)
                            .padding()
                    }
                    Spacer()
                }
                .padding(.top, 50)
            }
        }
//        .onAppear{
//            if alarmVm.seconds == 1 {
//                print("１秒")
//                isModal = true
//            }
//        }
    }

    struct WaitView_Previews: PreviewProvider {
        static var previews: some View {
            WaitView()
                .environment(\.locale, Locale(identifier: "ja_JP"))
//                .environmentObject(TimerVm())
                .environmentObject(AlarmVm())
        }
    }
}
