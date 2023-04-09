//
//  ExplainView.swift
//  DormireTimer
//
//  Created by 児島　陸斗 on 2023/01/20.
//

import SwiftUI

struct ExplainView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            //            ScrollView {
            ZStack {
                VStack(alignment: .center) {
                    Text("DormireTimer")
                        .font(.custom("Selima", size: 70))
                        .foregroundColor(.white)
                        .padding(.top, 40)
                        .padding(.bottom, 60)

                    VStack(spacing: 10) {
                        Text("※スマートフォンを使用しないで欲しいので、ホーム画面やロック画面に戻るとタイマーが停止します")
                            .font(.custom("Selima", size:20))
                            .foregroundColor(.white)
                            .padding()
                            .lineLimit(nil)

                        Text("このアプリを起動したまま、眠るまでの時間を有意義に使ってください!")
                            .font(.custom("Selima", size:20))
                            .foregroundColor(.white)
                            .padding()
                            .lineLimit(nil)
                    }
                    .padding(20)
                    .border(Color.white, width: 3)
                    Spacer()
                }
                VStack {
                    Image("sheep")
                        .resizable()
                        .frame(width: 350, height: 250)
                        .offset(y: 180)

                }
            }
            //            }
        }
    }
}

struct ExplainView_Previews: PreviewProvider {
    static var previews: some View {
        ExplainView()
    }
}
