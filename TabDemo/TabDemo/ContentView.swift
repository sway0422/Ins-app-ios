//
//  ContentView.swift
//  TabDemo
//
//  Created by Wei Si on 8/19/21.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
            }
            .navigationTitle("Home")
        }
    }
    
    
}

struct SettingsView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
            }
            .navigationTitle("Settings")
        }
    }
    
    
}

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
