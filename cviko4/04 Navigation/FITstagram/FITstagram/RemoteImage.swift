//
//  RemoteImage.swift
//  FITstagram
//
//  Created by Tomáš Geržičák on 20.10.2021.
//

import SwiftUI

struct RemoteImage: View {
    var imageUrl: String
    @State var image: Image?
    var body: some View {
        if let image = image {
            image
                .resizable()
        } else {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .onAppear{
                    fetchImage()
                }
        }
    }
    
    private func fetchImage(){
        DispatchQueue.global().async {
            let url = URL(string: imageUrl)!
            let data = try! Data(contentsOf: url)
            let uiImage = UIImage(data: data)!
            DispatchQueue.main.async {
                image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(imageUrl: "https://www.zing.cz/wp-content/uploads/2021/10/thebatman.jpg")
    }
}
