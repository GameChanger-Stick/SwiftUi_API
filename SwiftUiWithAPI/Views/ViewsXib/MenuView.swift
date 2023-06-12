

import SwiftUI

struct MenuView: View {
    @State private var isActive = false
    @EnvironmentObject private var viewRouter: ViewRouter

    init() {
            UITableView.appearance().showsVerticalScrollIndicator = false
        UIScrollView.appearance().bounces = false

        }
    @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    let mygroups = [
        MenuData(title: Constants.home, items: [itemData( title: Constants.profitability, image: Image("Profit")),itemData(title: Constants.fennel, image: Image("funnel"))]),
       
        MenuData(title: Constants.sales, items: [itemData( title: Constants.helpRate, image: Image("help")),
                                                 itemData(title: Constants.dailyFlash, image: Image("dailyFlash")),itemData(title: Constants.incurancePlus, image: Image("incurence"))]),
        MenuData(title: Constants.finance, items: [itemData( title: Constants.plSummary, image: Image("summary"))]),
        MenuData(title: Constants.marketing, items: [itemData( title: Constants.attribution, image: Image("summary"))]),
       
        MenuData(title: Constants.others, items: [itemData( title: Constants.settings, image: Image("summary")),itemData( title: Constants.logout, image: Image("summary"))]),
           
        ]
    
    var body: some View {
        
        
        
        
        
        List (mygroups) { gr in
            Section(header:
                        Button(action: {
                self.isActive = true
                //viewRouter.currentView = .main
                

               self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text(gr.title)
                        }) {
                ForEach(gr.items) { obj in
                    HStack(spacing:10) {
                        MenuViewList(data: obj)

                        if obj.title == "Logout"{
                           

                        }else{
                        }
                    }
                    //BUGUS
                  //  .listRowSeparator(.hidden)
                }

        }
           .listStyle(.grouped)
           // .headerProminence(.increased)
        }
       // .shadow(color: .gray, radius: 1, x: 0, y: 0)
    }

}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}



/*
 MenuData(title: Constants.appointment, items: [itemData( title: Constants.cancellation, image: Image("cancel")),
                                                itemData(title: Constants.openSlot, image: Image("openSlot")),itemData(title: Constants.schedule, image: Image("openSlot-1")),itemData(title: Constants.health, image: Image("health")),itemData(title: Constants.covidTracker, image: Image("tracker"))]),
 */
