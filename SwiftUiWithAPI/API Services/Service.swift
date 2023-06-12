//
//  Service.swift
//  HTTPRequest
//
//  Created by Mukesh on 15/01/22.
//

import Foundation
import Combine
import Alamofire



class apiCall {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func getData(completion:@escaping ([Profibility]?) -> ()) {
        guard let url = URL(string: URLs.getProfitabilitySummary) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                do {
                    let users = try JSONDecoder().decode([Profibility].self, from: data)
                    //  print(users)
                    DispatchQueue.main.async {
                        completion(users)
                    }
                }catch{
                    completion(nil)
                }
            }else{
                completion(nil)
                
            }
        }
        .resume()
    }
    
    //MARK :- get Detail of category
    func getCategoryDetail(_categoryName:String,completion:@escaping ([ModelClinicDetail]?) -> ()) {
        guard let url = URL(string: "https://dc.alpaca360.net/api/m/GetProfitabilityList?category=\(_categoryName)") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                do {
                    let users = try JSONDecoder().decode([ModelClinicDetail].self, from: data)
                    //   print(users)
                    DispatchQueue.main.async {
                        completion(users)
                    }
                }catch{
                    completion(nil)
                }
            }else{
                completion(nil)
                
            }
            
        }
        .resume()
    }
    
}
