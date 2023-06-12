//
//  viewProfibility.swift
//  ABI Project
//
//  Created by Mukesh on 15/01/22.
//

import SwiftUI

struct viewProfibility: View {
    var profibility: Profibility?
    var body: some View {
        
        HStack(alignment:.bottom,spacing:5) {
            VStack(alignment:.leading,spacing:5){
                Text((profibility?.category) ?? "name")
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(Color.init(hex: profibility?.categoryColor ?? "0xFFFFFF"))
                Text("EBITDA Range: ")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
              + Text((profibility?.ebitdaRange) ?? "dasdsa")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
               
            }
            HStack{
                Spacer()
            }
            HStack(alignment:.center) {
                Text("\(String(format: "%d", profibility?.count ?? 2))")
                    .bold()
                                    .font(.system(size: 20))
                                    .background(Color.clear)
                                    .foregroundColor(.white)
                                    .frame(width:40,height: 40)
                                    
            }
            .background(Color.init(hex: profibility?.categoryColor ?? "0xFFFFFF"))
            .cornerRadius(10)
        }
        .padding(5)
    }
}

struct viewProfibility_Previews: PreviewProvider {
    static var previews: some View {
        viewProfibility()
            .previewLayout(.fixed(width: 400, height: 70))
    }
       
}
