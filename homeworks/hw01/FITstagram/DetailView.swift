//
//  DetailView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/6/21.
//

import SwiftUI

struct DetailView: View {
    var post: Post
    var commentsViewModel: CommentsViewModel
    
    init(post: Post){
        self.post = post
        self.commentsViewModel = .init(postID: post.id)
    }

    var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text(post.author.username)
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
                
                Rectangle()
                    .fill(Color.white)
                    .aspectRatio(1, contentMode: .fill)
                    .overlay(
                        RemoteImage(url: post.photos.first!)
                            .aspectRatio(contentMode: .fill)
                    )
                    .clipped()
                
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
                CommentsView(viewModel: self.commentsViewModel)
            }
            Button("Přidat nový komentář"){
                self.commentsViewModel.isNewCommentShown = true
            }
        }
    private func buttonImage(_ systemName: String) -> some View {
        Image(systemName: systemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 24)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(post: Post(
                id: "",
                author: .dummy,
                likes: 1024,
                photos: [URL(string: "https://placeimg.com/320/320")!],
                description: "dummy.description",
                comments: 10
            ))
        }
    }
}
