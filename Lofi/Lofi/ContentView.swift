//
//  ContentView.swift
//  Lofi
//
//  Created by Nathan Cheng on 8/9/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State private var isRotated = false
    var body: some View {
        ZStack {
            //set background color
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    Text("Lofi Player")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.buttonColor)
                }
                Spacer()
                //
                ZStack{
                    Circle()
                        .foregroundColor(.buttonColor)
                        .frame(width: 180, height: 180, alignment: .center)
                        .zIndex(0)
                    Image("vinl")
                        .zIndex(1)
                        .rotationEffect(Angle.degrees(isRotated ? 360 : -360))
                        .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: isRotated)
                }
                //
                Spacer()
                HStack {
                    Button(action: {
                        //Play Button
                        self.audioPlayer.play()
                        self.isRotated = true
                        print("Spinning Disk")
                    }) {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.buttonColor)
                    }
                    Button(action: {
                        //Pause Button
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "pause.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.buttonColor)
                    }
                    Button(action: {
                        //Next Button
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "forward.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.buttonColor)
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "Cozy", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.pause()
            print("Attatched: \(sound!)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
