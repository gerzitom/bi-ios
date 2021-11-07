//
//  ProfileView.swift
//  FITstagram
//
//  Created by Tomáš Geržičák on 20.10.2021.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("TOG")
                    .padding()
                LazyVGrid(
                    columns: [
                        GridItem(spacing: 1),
                        GridItem(spacing: 1),
                        GridItem(spacing: 1)
                    ]
                ){
                    ForEach(0..<5){_ in
                        if #available(iOS 15.0, *) {
                            AsyncImage(
                                url: URL(string: "https://www.zing.cz/wp-content/uploads/2021/10/thebatman.jpg"),
                                content: { image in
                                    image.resizable()
                                         .aspectRatio(contentMode: .fit)
                                         .frame(maxWidth: 300, maxHeight: 100)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                        } else {
                            RemoteImage(imageUrl: "https://www.zing.cz/wp-content/uploads/2021/10/thebatman.jpg")
                        }
                    }
                }
            }
        }
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProfileView()
        }
    }
}
