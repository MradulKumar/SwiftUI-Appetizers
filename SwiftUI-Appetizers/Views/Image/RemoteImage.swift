//
//  RemoteImage.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 04/09/24.
//

import UIKit
import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func loadFromUrlString(urlString : String) {
        NetworkManager.shared.downloadImage(from: urlString) { uiImage in
            DispatchQueue.main.async {
                guard let uiImage = uiImage else { return }
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    
    let urlString: String
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.loadFromUrlString(urlString: urlString) }
    }
}
