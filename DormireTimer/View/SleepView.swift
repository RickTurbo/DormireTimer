//
//  SleepView.swift
//  DormireTimer
//
//  Created by 児島　陸斗 on 2022/12/03.
//

import SwiftUI

struct SleepView: View {
    let now = Date()
    let dateFormatter = DateFormatter()
    let dateFormatter2 = DateFormatter()
    //    @EnvironmentObject var timerVm:TimerVm
    @Environment(\.dismiss) var dismiss
    @State var isModal:Bool = false
    @EnvironmentObject var alarmVm2: AlarmVm
    let musicplayer = SoundPlayer()
    @StateObject var alarmVm = AlarmVm()
    @Environment(\.presentationMode) var presentation
    let AdMobID: String = "ca-app-pub-7803037430770004/9076802256"
    

    init() {
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
        dateFormatter2.dateFormat = DateFormatter.dateFormat(fromTemplate: "Hm", options: 0, locale: Locale(identifier: "ja_JP"))
    }

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Spacer()
            ScrollView {
                VStack(alignment:.center){
                    VStack(alignment: .trailing) {
                        //                    Text("アラーム完了画面")
                        //                        .font(.title)
                        //                        .fontWeight(.heavy)
                        //                        .foregroundColor(.white)
                        Text("DormireTimer")
                            .font(.custom("Selima", size: 70))
                            .padding(.top, 30)
                            .foregroundColor(.white)

//                        Text(dateFormatter.string(from: now))
//                            .font(.title)
//                            .fontWeight(.heavy)
//                            .padding()
//                            .foregroundColor(.white)
                        Text(dateFormatter2.string(from: now))
                            .font(.custom("Selima", size: 60))
                            .padding()
                            .foregroundColor(.white)
                    }
                    
                    VStack {
                        Text(alarmVm2.alarmTime2)
                            .font(.custom("Selima", size: 100))
//                            .scaleEffect(x: 2, y: 2)
                            .foregroundColor(.white)
                        Image("sheep")
                            .resizable()
                            .frame(width: 250, height: 150)
                    }
                    
                    Spacer()
                    
//                    Text("眠る準備は出来ましたか？")
//                        .fontWeight(.heavy)
//                        .font(.title)
//                        .padding(.bottom, 60)
//                        .foregroundColor(.white)
                    
                    Button(action: {
                        //                    isModal = true
                        //                    musicplayer.stopAllMusic()
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Sleep")
                            .font(.custom("Selima", size: 50))
                            .frame(width: 150,height: 70)
                            .background(Color.yellow)
                            .foregroundColor(Color.white)
                            .cornerRadius(15, antialiased: true)
                    }
                    .padding(.bottom, 24)
                    Spacer()
                        .disabled(alarmVm2.canTap2)
                        .fullScreenCover(isPresented: $isModal) {
                            Home()
                        }
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                            .font(.custom("Selima", size: 50))
                            .frame(width: 150,height: 70)
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(15, antialiased: true)
                            .padding()
                    }
                    Spacer()
                    
                    VStack {
                        BannerAd(unitID: AdMobID)
                            .frame(width: UIScreen.main.bounds.width, height: 50)
                    }

                }
            }
        }
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
            .environment(\.locale, Locale(identifier: "ja_JP"))
        //            .environmentObject(TimerVm())
            .environmentObject(AlarmVm())
    }
}

