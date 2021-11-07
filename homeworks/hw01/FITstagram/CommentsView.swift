//
//  CommentsView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/11/21.
//

import SwiftUI

struct CommentsView: View {
    @ObservedObject private(set) var viewModel: CommentsViewModel
    
    var body: some View {
        CommentsContentView(state: viewModel.state)
            .onAppear {
                viewModel.fetchComments()
            }
            .sheet(isPresented: $viewModel.isNewCommentShown){
                NavigationView{
                    NewCommentView(isPresented: $viewModel.isNewCommentShown)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.isNewCommentShown = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
    }
}

private struct CommentsContentView: View {
    let state: CommentsViewModel.DataState
    
    var body: some View {
        switch state {
        case .loading:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        case .error:
            Text("Komentáře se nepodařilo načíst")
        case .comments(let comments):
            List(comments, id: \.id) { comment in
                Group {
                    Text(comment.author.username)
                        .fontWeight(.semibold)
                    + Text(" " + comment.text)
                }
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView(viewModel: .init(postID: "1"))
        }
    }
}
