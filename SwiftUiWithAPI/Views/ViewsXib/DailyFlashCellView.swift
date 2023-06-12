//
//  DailyFlashCellView.swift
//  ABI Project
//
//  Created by Mukesh Pro on 07/02/22.
//

import SwiftUI

struct DailyFlashCellView: View {
    @State var region : DailyFlashByRegion?

    var body: some View {
        
  VStack(alignment: .trailing) {
      VStack(spacing: 5) {
          VStack {
              HStack {
                  Text(region?.name ?? "Chandigarh")
                      .font(.title2)
                      .fontWeight(.semibold)

                  Spacer()
              }
          }
        
          VStack {
              HStack {
                  Text("Delivered")
                      .fontWeight(.semibold)
                      .frame(width: 115, alignment: .leading)

                  Spacer()

                  Text("\(region?.totalDailyDelivered.roundedWithAbbreviations ?? "34K") Daily")
                      .frame( alignment: .trailing)

                  Spacer()

                  Text("\(region?.totalDelivered.roundedWithAbbreviations ?? "34K") MTD")
                      .frame( alignment: .trailing)
              }
          }
         
          VStack {
              HStack {
                  Text("Ordered")
                      .fontWeight(.semibold)
                      .frame(width: 115, alignment: .leading)

                  Spacer()

                  Text("\(region?.totalDailyOrder.roundedWithAbbreviations ?? "34K") Daily")
                      .frame( alignment: .trailing)

                  Spacer()

                  Text("\(region?.totalOrder.roundedWithAbbreviations ?? "34K") MTD")
                      .frame( alignment: .trailing)
              }
          }

          VStack {
              HStack {
                  Text("Sales Appts")
                      .fontWeight(.semibold)
                      .frame(width: 115, alignment: .leading)

                  Spacer()

                  Text("\(region?.totalAppointment.roundedWithAbbreviations ?? "34K" ) MTD")
                      .frame(alignment: .trailing)

                  Spacer()

                  Text("\(region?.totalRemaining.roundedWithAbbreviations ?? "34K") Rem.")
                      .frame(alignment: .trailing)
              }
          }
      }
      
      .padding(8)
//
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(Color(UIColor.systemBackground))

      .cornerRadius(6)

  }

    }
}

struct DailyFlashCellView_Previews: PreviewProvider {
    static var previews: some View {
        DailyFlashCellView()
            .previewLayout(.fixed(width: 400, height: 200))

    }
}
struct DailyFlashByRegion:Hashable{
    var name : String!
    var totalDailyOrder : Int!
    var totalOrder : Int!
    var totalDailyDelivered : Int!
    var totalDelivered : Int!
    var totalAppointment : Int!
    var totalRemaining : Int!
    
    init(name:String,totalDailyOrder:Int,totalOrder:Int,totalDailyDelivered:Int,totalDelivered:Int,totalAppointment:Int,totalRemaining:Int){
        self.name = name
        self.totalOrder = totalOrder
        self.totalDelivered = totalDelivered
        self.totalRemaining = totalRemaining
        self.totalAppointment = totalAppointment
        self.totalDailyOrder = totalDailyOrder
        self.totalDailyDelivered = totalDailyDelivered
    }
}
