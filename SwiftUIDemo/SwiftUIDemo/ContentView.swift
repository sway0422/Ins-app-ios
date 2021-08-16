//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Wei Si on 8/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding()
                
                Text("First View")
                    .font(.system(size: 30, weight: .light,
                                  design: .default))
                    .padding()
                NavigationLink(
                    
                    destination: Text("Hello World"),
                    label: {
                        Text("Navigate")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
