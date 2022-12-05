//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by Forum Gorawala on 2022-12-05.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
        .resizable()
        .scaledToFit()
        
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth:128)
            .foregroundColor(.blue)
            .opacity(0.5)
    }
}

struct ContentView: View {
    
    private let imageURL:String = "https://purepng.com/public/uploads/large/purepng.com-mariomariofictional-charactervideo-gamefranchisenintendodesigner-1701528634653vywuz.png"
    
    var body: some View {
        // Mark: -1. BASIC
        
        // AsyncImage(url:URL(string: imageURL))
        
        // Mark: -2. SCALE
        
        // AsyncImage(url:URL(string: imageURL),scale:3.0)
        
        // Mark: -3. PLACEHOLDER
        
       /* AsyncImage(url:URL(string: imageURL)){
            image in
            image.imageModifier()
        }placeholder:{
            Image(systemName: "photo.circle.fill")
                .iconModifier()
            
        }
        .padding(40)*/
        
        // Mark: -4. PHASE
        
        /*AsyncImage(url: URL(string: imageURL)){
            phase in
            
            //SUCCESS: The image successfully loaded.
            //FAILURE: The image failed to load with an error.
            //EMPTY: No Image is loaded
            
            if let image = phase.image {
                image.imageModifier()
            }
            else if phase.error != nil {
                Image(systemName:"ant.circle.fill").iconModifier()
            }
            else {
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }
        .padding(40)*/
        
        // Mark: -5. ANIMATION
        
        AsyncImage(url:URL(string: imageURL), transaction:Transaction(animation:.spring(response: 0.5,dampingFraction: 0.6,blendDuration: 0.25))) { phase in
            switch phase{
            case .success(let image):
                image
                    .imageModifier()
//                    .transition(.move(edge:.bottom))
//                    .transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image.init(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image.init(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
