//
//  Network.swift
//  TestApp
//
//  Created by Mac on 2/14/21.
//

import UIKit

//func getAlert(message : String) -> UIAlertController {
//    let alert = UIAlertController(title: "Упс!", message: message, preferredStyle: .alert)
//    let action = UIAlertAction(title: "OK", style: .default)
//    alert.addAction(action)
//    return alert
//}

final class NetworkManager {
    
    static func getContacts(/*completion: @escaping (UIAlertController) -> Void*/) -> [Contact] {
        
        var contacts: Requests = Requests(requests: [])
        let group = DispatchGroup()
        let url = URL(string: "https://5e3c202ef2cb300014391b5a.mockapi.io/testapi")
        guard let jsonURL = url else {
//            completion(getAlert(message: "Не удалось загрузить данные с сервера"))
            return contacts.requests
        }
        group.enter()
        URLSession.shared.dataTask(with: jsonURL) { (data,response,error) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let dataContacts = data else {
//                completion(getAlert(message: error.localizedDescription))
                return
            }
            
            do {
                contacts = try JSONDecoder().decode(Requests.self, from: dataContacts)
            } catch {
//                completion(getAlert(message: error.localizedDescription))
                print(error.localizedDescription)
            }
            group.leave()
        }.resume()
        group.wait()
        return contacts.requests
    }
}
