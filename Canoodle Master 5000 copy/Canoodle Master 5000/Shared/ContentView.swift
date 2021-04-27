//
//  ContentView.swift
//  Shared
//
//  Created by Peter Johnson on 4/12/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    init() {
           UITabBar.appearance().barTintColor = UIColor.black
           UITabBar.appearance().tintColor = .black
       }
    
    var body: some View {
       
        TabView{
            
            (Home())
                .tabItem {
                    VStack {
                        Image("home")
                        Text("Home")
                    }
                }.tag(1)
                    
            Text("Item 2")
                .tabItem {
                    VStack {
                        Image("discover")
                        Text("Discover")
                    }
                }.tag(2)
            
            Text("Item 3")
                .tabItem {
                    VStack {
                        Image("main")
                    }
                }.tag(3)
            
            Text("Item 4")
                .tabItem {
                    VStack {
                        Image("inbox")
                        Text("Inbox")
                    }
                }.tag(4)
            
            Text("Item 5")
                .tabItem {
                    VStack {
                        Image("me")
                        Text("Me")
                    }
                }.tag(5)
               
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var index = 0;
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State var videos = [
        AVPlayer(url: URL(string: "https://assets.mixkit.co/videos/preview/mixkit-young-man-skating-in-a-parking-lot-34550-large.mp4")!),
        AVPlayer(url: URL(string: "https://assets.mixkit.co/videos/preview/mixkit-pink-and-blue-ink-1192-large.mp4")!),
        AVPlayer(url: URL(string: "https://www.tiktokdownloader.org/user_videos/91451852583.mp4")!),
        
        AVPlayer(url: URL(string: "https://www.tiktokdownloader.org/user_videos/LF5Xdz5Gn8.mp4")!),
        AVPlayer(url: URL(string: "https://www.tiktokdownloader.org/user_videos/LF5Xdz5Gn8.mp4")!),
        AVPlayer(url: URL(string: "https://www.tiktokdownloader.org/user_videos/71066998458.mp4")!),
        AVPlayer(url: URL(string: "https://www.tiktokdownloader.org/user_videos/7Jv7XceO3j.mp4")!),
        AVPlayer(url: URL(string: "https://www.tiktokdownloader.org/user_videos/91451852583.mp4")!),
        
        
    ]
    
    var body: some View{
        
        TabView(selection: $index){
            
            ForEach(0..<videos.count,id: \.self){ i in
                Player(video: $videos[i])
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .rotationEffect(.init(degrees: -90))
                   .frame(width:UIScreen.main.bounds.width)
            }
        }
        .rotationEffect(.init(degrees:90))
        .frame(width: UIScreen.main.bounds.height - (edges!.top + edges!.bottom))
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
      .background(Color.black.ignoresSafeArea(.all, edges: .all))
      
    }
}
        
        
        
    
        
       

struct Player : View {
    @Binding var video: AVPlayer
    var body: some View{
        VideoPlayer(player: video)
    }
}

