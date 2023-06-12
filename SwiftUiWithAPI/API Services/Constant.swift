//
//  Constant.swift
//  ABI Project
//
//  Created by Mukesh Pro on 21/01/22.
//

import Foundation
struct Constants {
    static let url = URLs()
    static let audience = "https://alpaca360.us.auth0.com/userinfo"
    static let redirectUrl = "REPLACEME"
    
    static let domain = "alpaca360.us.auth0.com"
    static let clientId = "Ux1yqQvnAK1nHvpJjDGwzSS70OsG8DGb"
   // static let audience = "REPLACEME"
    //static let redirectUri = "REPLACEME"

    // This one I'm not 100% sure about. If I set it to https:// + the auth0 domain it works
    // If I set it to the app identifier, it still works, but shows an error in Auth0 logs
    static let origin = "https://alpaca360.us.auth0.com"
    
    //Text
    static let dailyFlash = "Daily Flash"
    static let home = "Home"
    static let profitability = "Profitability"
    static let appointment = "Appointment"
    static let cancellation = "Cancellation"
    static let openSlot = "Open Slot"
    static let schedule = "Schedule"
    static let health = "Health"
    static let covidTracker = "Covid Tracker"
    static let helpRate = "Help Rate"
    static let incurancePlus = "Insurance Plus"
    static let finance = "Finance"
    static let plSummary = "P&L Summary"
    static let marketing = "Marketing"
    static let attribution = "Attribution"
    static let others = "Others"
    static let settings = "Settings"
    static let logout = "Logout"
    static let fennel = "Funnel"
    static let sales = "Sales"
    static let underConstruction = "Under Construction"
    
    
}
struct URLs{
   private static let base = "https://dc.alpaca360.net/api/m/"
    static let getProfitabilitySummary =  "\(base)" + "GetProfitabilitySummary"
    static let getDailyFlash = "\(base)" + "GetDailyFlashReport"
//    static let getUnderConstruction = "\(base)" + "UnderConstruction"
}
