//
//  ContentView.swift
//  DormireTimer
//
//  Created by 児島　陸斗 on 2022/12/03.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTag = 1
    let AdMobID: String = "ca-app-pub-7803037430770004/9076802256"

    var body: some View {
        VStack {
            TabView(selection: $selectedTag) {
                Home()
                    .tabItem{
                        Image(systemName: "powersleep")
                        Text("Timer")
                    }.tag(1)
                ExplainView()
                    .tabItem{
                        Image(systemName: "figure.walk")
                        Text("Explain")
                    }.tag(2)
            }
            VStack {
                BannerAd(unitID: AdMobID)
                    .frame(width: UIScreen.main.bounds.width, height: 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, Locale(identifier: "ja_JP"))
            .environmentObject(TimerVm())
            .environmentObject(AlarmVm())
    }
}

