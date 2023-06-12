//
//  WelcomeView.swift
//  ABI Project
//
//  Created by Mukesh Pro on 22/01/22.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isActive = true
    @EnvironmentObject private var viewRouter: ViewRouter

        var body: some View {
            
  
            
           NavigationView{
               
               VStack {
                          if viewRouter.currentView == .login {
                              HomeView()
                          } else if viewRouter.currentView == .main {
                              HomeView()
                          }
                      }

          }

           .navigationViewStyle(StackNavigationViewStyle())

        }
    
}

struct WelcomeView_Previews: PreviewProvider {

    static var previews: some View {

        
        WelcomeView()


    }
}

enum AppView {
    case login, main
}

class ViewRouter: ObservableObject {
    @Published var currentView: AppView = UserDefaults.standard.value(forKey: "login") != nil ? .main:.login
}
