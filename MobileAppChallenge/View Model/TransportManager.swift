//
//  TransportManager.swift
//  Created by Sabrina Hoque Tuli on 30/5/21.
//

import Foundation
import SwiftUI
import Network

class TransportManager: ObservableObject {
    @Published var showTrum = false
    @Published var showTrain = false
    @Published var showExpress = false
    @Published var showTopup = false
    @Published var internetMonitor = false
    @Published var trans = [Transport]()
      
    let sourcesURL = URL(string: "https://mocki.io/v1/91fba448-7ed6-4121-8f1a-a50de82d820f")
    init() {
        /****  Network Checking **/
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Internet Connection available!")
                
                guard let url = self.sourcesURL else { return }
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    guard let data = data else { return }
                    let trans = try! JSONDecoder().decode([Transport].self, from: data)
                    DispatchQueue.main.async {
                        self.internetMonitor = true
                        self.trans = trans
                       // print(trans)
                    }
                    print(" Transport API values fetched Successfully")
                    }.resume()
            } else {
                print("No  internet connection.")
                self.internetMonitor = false
            }

            print(path.isExpensive)
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        
        
        
        
    }
    
    
    
    func transportDateFormat(itemdate: String) ->String
    {
        let dateFormatter: DateFormatter = {
            $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            return $0
        }(DateFormatter())
        
        let currDateFormatter: DateFormatter = {
            $0.dateFormat = "dd MMM, yyyy hh:mm a"
            return $0
        }(DateFormatter())
        //print(itemdate)
        currDateFormatter.timeZone = .current
        let date = dateFormatter.date(from: itemdate ?? "") ?? Date()
        let detailText = currDateFormatter.string(from: date)

        return detailText
        
    }
    
    func addItem() {
        self.trans.append(Transport(typeId: 0,
                                    departureTime: "2021-05-30T09:10:00.000Z",
                                    name: "ElementEngineering",
                                    latitude: -38.1429785,
                                    longitude: 145.1238226,
                                    isExpress: true,
                                    hasMyKiTopUp: nil
                                    ))
     }
 

     func delete(at indexSet: IndexSet) {
        for index in indexSet {
            self.trans.remove(at: index)
        }
     }
 
  }
