//
//  HeaderView.swift
//  ABI Project
//
//  Created by Mukesh on 19/01/22.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(alignment: .center, spacing:5){
            VStack(alignment:.leading){
                Text("Clinics")
                    .foregroundColor(.black)
            }
            Spacer()
            Text("Revenue $")
                .foregroundColor(.black)
                .frame(width:100)
            Text("EBITA $")
                .foregroundColor(.black)
                .frame(width:70)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
