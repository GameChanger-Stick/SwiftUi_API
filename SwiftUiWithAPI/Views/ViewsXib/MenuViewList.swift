//
//  MenuViewList.swift
//  ABI Project
//
//  Created by Mukesh on 15/01/22.
//

import SwiftUI

struct MenuViewList: View {
    @State private var isActive = false
    @EnvironmentObject private var viewRouter: ViewRouter

    @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>

    var data : itemData?
    var body: some View {
        
        if data!.title == Constants.profitability{
            NavigationLink(destination: HomeView(),
                           isActive: $isActive) {
                Button(action: {
                }) {
                    HStack{
                        HStack{
                            data!.image
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        Text(data?.title ?? "hello")
                    }
                }
            }
        }
//        else if data!.title == Constants.dailyFlash{
//            NavigationLink(destination: GetDailyFlashView(),
//                           isActive: $isActive) {
//                Button(action: {
//                   // self.isActive = true
//                }) {
//                    HStack{
//                        HStack{
//                            data!.image
//                                .resizable()
//                                .frame(width: 20, height: 20, alignment: .center)
//                        }
//                        Text(data?.title ?? "hello")
//                    }
//                }
//            }
//        }
        
            else{
                
                Button(action: {
                    self.isActive = true
                    if data!.title == "Logout"{
                        UserDefaults.standard.removeObject(forKey: "login")
                        DispatchQueue.main.async {
                             viewRouter.currentView = .login

                        }
                        
                    }

                }) {
                    HStack{
                        HStack{
                            data!.image
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        Text(data?.title ?? "hello")

                    }
                }
                
                
          
       }
        
        
        
       
        
    }
//    func getViewController(id:String) -> View{
//        if id == "Profitability"{
//            return HomeView()
//        }else if id ==  "Logout"{
//            return LoginView()
//        }
//    }
}

struct MenuViewList_Previews: PreviewProvider {
    static var previews: some View {
        MenuViewList()
            .previewLayout(.fixed(width: 200, height: 50))
    }
}



struct RootPresentationModeKey: EnvironmentKey {
    static let defaultValue: Binding<RootPresentationMode> = .constant(RootPresentationMode())
}

extension EnvironmentValues {
    var rootPresentationMode: Binding<RootPresentationMode> {
        get { return self[RootPresentationModeKey.self] }
        set { self[RootPresentationModeKey.self] = newValue }
    }
}

typealias RootPresentationMode = Bool

extension RootPresentationMode {
    
    public mutating func dismiss() {
            self.toggle()

    }
}

