//
//  ContentView.swift
//  Navigation&Lists
//
//  Created by Shaik Areef on 12/02/25.
//

import SwiftUI

struct VideoListView: View {
    
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
        NavigationView{
            List(videos, id: \.id){ video in
                NavigationLink(destination: VideoDetailView(video: video), label: {
                    VideoCell(video: video)
                })
            }
            .navigationTitle("Sean's Top 10")
        }
    }
}

struct VideoCell: View {
    
    var video : Video
    
    var body: some View {
        HStack{
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
                .padding(.vertical, 3)
            VStack(alignment: .leading, spacing: 5){
                Text(video.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    VideoListView()
}
