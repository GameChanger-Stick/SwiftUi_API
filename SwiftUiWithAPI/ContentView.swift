//
//  ContentView.swift
//  SwiftUiWithAPI
//
//  Created by Muki on 12/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
//
//  ChatListModel.swift
//  HTTPRequest
//  Created by Mukesh on 15/01/22.
//

import Foundation
import Combine
import SwiftUI


struct ProfibilityModel: Codable {
    var data : [Profibility]!
}

struct Profibility: Codable,Identifiable,Hashable {
    let id = UUID()
    var category : String!
    var categoryColor : String!
    var count : Int!
    var ebitda : Double!
    var ebitdaRange : String!
    var revenue : Int!
}

struct MenuData: Identifiable {
    var id = UUID()
    var title: String
    var items: [itemData]
}

struct itemData : Identifiable {
    var id = UUID()
    var title: String
    var image: Image
}

//
//    RootClass.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ModelClinicDetail : Codable {

    let clinic : String?
    let ebitda : Double?
    let region : String?
    let revenue : Double?


    enum CodingKeys: String, CodingKey {
        case clinic = "clinic"
        case ebitda = "ebitda"
        case region = "region"
        case revenue = "revenue"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        clinic = try values.decodeIfPresent(String.self, forKey: .clinic)
        ebitda = try values.decodeIfPresent(Double.self, forKey: .ebitda)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        revenue = try values.decodeIfPresent(Double.self, forKey: .revenue)
    }


}


//MARK :- Daily Flash Model
struct DailyFlash: Codable,Identifiable,Hashable {
    let id = UUID()
    var clinic : String!
        var dailyNetFittedRevenue : Double!
        var dailyNetRevenue : Double!
        var mtdNetFittedRevenue : Double!
        var mtdNetRevenue : Double!
        var mtdRevAppts : Int!
        var mthRevApptsTarget : Double!
        var region : String!
        var remainingRevAppts : Int!

}

