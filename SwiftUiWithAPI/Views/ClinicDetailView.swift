//
//  ClinicDetailView.swift
//  ABI Project
//
//  Created by Mukesh on 18/01/22.
//

import SwiftUI

struct ClinicDetailView: View {
    @State var clinicData: [ModelClinicDetail] = []
    @State var prrofitabilityData: Profibility?
    @State var progressViewHidden = false
    @State var isRevenueSort = false
    @State var isEbitaSort = false
    
    var body: some View {
        VStack(alignment: .leading,spacing: 5) {
            HStack(alignment: .center, spacing:5){
                VStack(alignment:.leading){
                    Text(prrofitabilityData?.category ?? "")
                        .font(Font.system(size: 20))
                      //  .foregroundColor(.white)
                        .bold()
                    Text("EBITDA Range \(prrofitabilityData?.ebitdaRange ?? "")")
                        .font(Font.system(size: 12))
                    
                      //  .foregroundColor(.white)
                        .bold()
                }
                Spacer()
                Text("#\(prrofitabilityData?.count ?? 0)")
                    .foregroundColor(.white)
                    .bold()
            }
            .padding()
            .background(Color.init(hex:prrofitabilityData?.categoryColor ?? ""))
            
            .cornerRadius(10)
            //2ndview
            HStack {
                Text("Revenue $ \(Double(prrofitabilityData?.revenue ?? 00).formatNumber())")
                    .font(Font.system(size: 12))
                   // .foregroundColor(.gray)
                    .bold()
                Spacer()
                
                Text("EBITDA $ \((prrofitabilityData?.ebitda ?? 0).formatNumber())")
                    .font(Font.system(size: 12))
                  //  .foregroundColor(.gray)
                    .bold()
            }
            Spacer()
            VStack {
                HStack(alignment:.center) {
                    Spacer()
                    Text("List of Clinics")
                        .font(Font.system(size: 20))
                       // .foregroundColor(.black)
                        .bold()
                        .padding()
                    Spacer()
                }
             //   HeaderView()
                
                HStack(alignment: .center, spacing:5){
                  
                    VStack(alignment:.leading){
                        Text("Clinic")
                           // .foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    Button(action: {
                        print("sd")
                        if isRevenueSort{
                            isRevenueSort = false
                            self.clinicData = self.clinicData.sorted{$0.revenue! > $1.revenue!}
                        }else{
                            isRevenueSort = true
                            self.clinicData = self.clinicData.sorted{$0.revenue! < $1.revenue!}
                            
                        }
                    }) {
                        Text("Revenue $")
                        .foregroundColor(Color(UIColor.systemBackground))

                            .colorInvert()
                         //   .fontWeight(.semibold)
                            .frame(width:90)
                        }
                    Button(action: {
                        print("sd")
                        if isEbitaSort{
                            isEbitaSort = false
                            self.clinicData = self.clinicData.sorted{$0.ebitda! > $1.ebitda!}
                        }else{
                            isEbitaSort = true
                            self.clinicData = self.clinicData.sorted{$0.ebitda! < $1.ebitda!}
                        }
                    }) {
                        Text("EBITDA $")
                            .foregroundColor(Color(UIColor.systemBackground))

                                .colorInvert()
                           // .foregroundColor(.black)
                           // .fontWeight(.semibold)
                            .frame(width:90)
                    }
                }
                
                
                
                if !progressViewHidden {
                    HStack(alignment:.center) {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }
                List(clinicData.indices, id: \.self){ row in
                    
                    HStack(alignment: .center, spacing:5){
                        VStack(alignment:.leading){
                            Text(clinicData[row].clinic!)
                                //.font(Font.system(size: 18))
                                //.foregroundColor(.black)
                                .fontWeight(.semibold)
                            Text("Region: \(clinicData[row].region!)")
                                .font(Font.system(size: 12))
                               // .foregroundColor(.gray)
                                .bold()
                        }
                        Spacer()
                        Text("\(clinicData[row].revenue!.formatNumber())")
                           // .foregroundColor(.black)
                            .font(Font.system(size: 15))
                            .frame(width:90,alignment: .trailing)
                        Text("\(clinicData[row].ebitda!.formatNumber())")
                            .font(Font.system(size: 15))
                           // .foregroundColor(.black)
                            .frame(width:90,alignment: .trailing)
                    }
                    .padding(10)
                    .listRowInsets(EdgeInsets())
                   // .background(Color(UIColor.darkGray))

                }
                .listStyle(PlainListStyle())
                //BUGS
            }
            
            .onAppear {
                apiCall().getCategoryDetail(_categoryName: (prrofitabilityData?.category ?? "").lowercased()) { data in
                    progressViewHidden=true
                    if let clinicData = data{
                        self.clinicData = clinicData
                    }
                }
            }
            
            .navigationBarTitle("", displayMode: .inline)
        }
        .padding()
       // Spacer()
    }
    
}

struct ClinicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClinicDetailView()
    }
}
extension Int {
    var roundedWithAbbreviations: String {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 {
            return "\(round(million*10)/10)M"
        }
        else if thousand >= 1.0 {
            return "\(round(thousand*10)/10)K"
        }
        else {
            return "\(self)"
        }
    }
}

