//
//  Home.swift
//  DormireTimer
//
//  Created by 児島　陸斗 on 2022/12/03.
//

import SwiftUI

struct Home: View {
    //    @EnvironmentObject var timerVm: TimerVm
    //    @ObservedObject var timerVm = TimerVm()
    let dateFormatter = DateFormatter()
    @State var selectTime:String = ""
    @State var agoTime:Int = 0
    @State var isModal:Bool = false
    @StateObject var alarmVm = AlarmVm()
    @EnvironmentObject var alarmVm2: AlarmVm
    let musicplayer = SoundPlayer()
    @State var canTap: Bool = true
    let AdMobID: String = "ca-app-pub-7803037430770004/9076802256"

    init() {
        dateFormatter.timeStyle = .short
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier:  "Asia/Tokyo")
    }

    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            //            ScrollView {
            VStack(alignment: .center) {
                Text("DormireTimer")
                    .font(.custom("Selima", size: 70))
                    .padding(.top, 90)
                    .foregroundColor(.white)
                //                Spacer()
                VStack {
                    Image("sheep")
                        .resizable()
                        .frame(width: 200, height: 160)
                        .offset(x: 60, y: 90)

                    DatePicker("時刻を選択", selection:$alarmVm.selectionData2, displayedComponents: .hourAndMinute)
                        .onChange(of: alarmVm.selectionData2, perform: {value in
                            alarmVm2.alarmTime2 = dateFormatter.string(from: value)
                            canTap = false
                        })
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 300, height: 200)
                        .scaleEffect(x: 2, y: 2)
                        .labelsHidden()
                        .clipped()
                        .colorInvert()
                        .colorMultiply(.white)
                }
                .offset(y: -90)

                //                Spacer()
                //                Image("sheep")
                //                    .resizable()
                //                    .frame(width: 400, height: 300)
                //                Text(alarmVm2.alarmTime2)
                //                    .font(.title)
                //                    .fontWeight(.bold)

                Spacer()

                Button(action: {
                    isModal = true
                    alarmVm.runTimer()
                }) {
                    Text("START")
                        .font(.custom("Selima", size: 50))
                        .frame(width: 180,height: 80)
                        .background(canTap ? Color.yellow.opacity(0.5) : Color.yellow)
                        .foregroundColor(Color.white)
                        .cornerRadius(15, antialiased: true)
                }
                .padding(.bottom, 90)
                .disabled(canTap)
                .offset(y: -30)
                .fullScreenCover(isPresented: $isModal) {
                    // WaitView()
                    SleepView()
                        .onDisappear {
                            alarmVm.stopTimer()
                        }
                }
//                VStack {
//                    BannerAd(unitID: AdMobID)
//                }
                //                }
            }
            .padding()
        }

        //元のもの
        //        ZStack{
        //            Color.cyan
        //                .ignoresSafeArea()
        //            VStack(alignment: .center) {
        //                Text("DormireTimer")
        //                    .font(.largeTitle)
        //                    .fontWeight(.bold)
        //                    .padding(.top, 50)
        //
        //                Spacer()
        //                DatePicker("時刻を選択", selection:$timerVm.selectionData, displayedComponents: .hourAndMinute)
        //                    .onChange(of: timerVm.selectionData, perform: {value in
        ////                        selectTime = dateFormatter.string(from: value)
        //                        timerVm.alarmTime = dateFormatter.string(from: value)
        //                    })
        //                    .pickerStyle(WheelPickerStyle())
        //                    .frame(width: 300, height: 200)
        //                    .scaleEffect(x: 3, y: 3)
        //                    .labelsHidden()
        //                    .clipped()
        //                Spacer()
        //
        //                Text(timerVm.alarmTime)
        //                    .font(.title)
        //                    .fontWeight(.bold)
        //                Spacer()
        //
        //                Button(action: {
        //                    isModal = true
        //                    alarmVm.runTimer()
        //                }) {
        //                    Text("START")
        //                        .font(.largeTitle)
        //                        .frame(width: 200,height: 70)
        //                        .background(Color.yellow)
        //                        .foregroundColor(Color.white)
        //                        .cornerRadius(15, antialiased: true)
        //                }
        //                .fullScreenCover(isPresented: $isModal) {
        //                    WaitView()
        //                        .environmentObject(timerVm)
        //                }
        //                Spacer()
        //            }
        //        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environment(\.locale, Locale(identifier: "ja_JP"))
        //            .environmentObject(TimerVm())
            .environmentObject(AlarmVm())
    }
}
