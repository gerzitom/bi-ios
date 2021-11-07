//
//  PostView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/5/21.
//

import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(post.author.username)
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: { }) {
                    Image(systemName: "ellipsis")
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
            
            NavigationLink(destination: DetailView(post: post)) {
                Rectangle()
                    .fill(Color.white)
                    .aspectRatio(1, contentMode: .fill)
                    .overlay(
                        RemoteImage(url: post.photos.first!)
                            .aspectRatio(contentMode: .fill)
                    )
                    .clipped()
            }
            
            HStack(spacing: 16) {
                Button(action: { }) {
                    buttonImage("heart")
                }
                
                Button(action: { }) {
                    buttonImage("message")
                }
                
                Button(action: { }) {
                    buttonImage("paperplane")
                }
                
                Spacer()
            
                Button(action: { }) {
                    buttonImage("bookmark")
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            
            Text(String(post.likes) + " To se mi líbí")
                .fontWeight(.semibold)
                .padding(.horizontal, 8)
            
            Group {
                Text(post.author.username)
                    .fontWeight(.semibold)
                +
                Text(" " + post.description)
            }
            .padding(.horizontal, 8)
            
            NavigationLink(destination: CommentsView(viewModel: .init(postID: post.id))) {
                Text("Zobrazit všechny komentáře (\(post.comments))")
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .foregroundColor(Color.gray)
        }
    }
    
    private func buttonImage(_ systemName: String) -> some View {
        Image(systemName: systemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 24)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(
            post: Post(
                id: "",
                author: .dummy,
                likes: 1024,
                photos: [URL(string: "https://placeimg.com/320/320")!],
                description: "dummy.description",
                comments: 10
            )
        )
        .previewDevice("iPhone 12 Pro")
        .preferredColorScheme(.light)
    }
}
