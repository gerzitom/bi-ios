//
//  NewCommentView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/11/21.
//

import SwiftUI

struct NewCommentView: View {
    
    @State private var comment = ""
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Nový komentář", text: $comment)
                .padding(.horizontal, 20)
            
            Button("Přidat komentář") {
//                onNewComment(comment)
                isPresented = false
            }
            .font(.footnote.bold())
            .frame(maxWidth: .infinity)
            .disabled(comment.isEmpty)
            .padding(.vertical, 6)
            .padding(.horizontal, 10)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .padding(.horizontal)
            .navigationTitle("Nový komentář")
        }
    }
}

struct NewCommentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NewCommentView(
    //            onNewComment: { _ in },
                isPresented: .constant(false)
            )
        }
    }
}
