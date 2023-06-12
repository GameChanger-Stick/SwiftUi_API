//
//  HomeView.swift
//  ABI Project
//
//  Created by Mukesh on 14/01/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var category = [String]()
    @State private var color = [Color]()
    @State private var ebita = [Double]()
    @State var profibilityData: [Profibility] = []

    @State var showMenu = false
    @State var progressViewHidden = false
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false

        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.link,.font: UIFont.boldSystemFont(ofSize: 25)]
    }
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -10 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                //SHOW DATA ON LIST
                List(profibilityData.indices, id: \.self){ user in
                    
                    if user == profibilityData.count - 1{
                        PieChartView(titleChart: "Clinic Profibality", values: ebita, names: category, formatter: {value in String(format: "$%.2f", value)},colors: color)
                            .frame(height: geometry.size.width - 100)

                    }else{
                        
                        NavigationLink(destination: ClinicDetailView(prrofitabilityData: profibilityData[user])) {
                            Button(action: {
                            }) {
                                viewProfibility(profibility: profibilityData[user])
                            }
                        }
                      
                    }
                }

                //ADD SIDEMENU BUTTON
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            withAnimation {
                                self.showMenu.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                                .foregroundColor(.blue)
                                //.tint(.blue)
                        }
                    }
                }
                //SHOW MENU
                if self.showMenu {
                    MenuView()
                        .frame(width: geometry.size.width/1.5)
                        .transition(.move(edge: .leading))
                    
                }
                if !progressViewHidden {
                    HStack(alignment:.center) {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }
            }
            .gesture(drag)
        }
        //NAVIGATION BAR UPDATE
        .navigationBarBackButtonHidden(true)
        .accentColor(Color.primary)

        .navigationBarTitle("Clinic Profitability", displayMode: .large)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            //API CALL
            apiCall().getData { (users) in
                if let data = users{
                progressViewHidden = true
                self.profibilityData = data
                self.category = profibilityData.compactMap{$0.category}
                self.color = profibilityData.compactMap{Color.init(hex: $0.categoryColor)}
                self.ebita = profibilityData.map{Double($0.count.magnitude)}
                self.profibilityData.append(Profibility())
                }else{
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
struct MainView: View {
    
    @Binding var showMenu: Bool
    var body: some View {
        Button(action: {
            withAnimation {
                self.showMenu = true
            }
        }) {
            Text("Show Menu")
        }
    }
}
