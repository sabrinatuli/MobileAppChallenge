//
//  DetailView.swift
//  Created by Sabrina Hoque Tuli on 30/5/21.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var transMng: TransportManager
    var body: some View {
            NavigationView {
                VStack{
                    //Text("Hello World")
                    if (transMng.internetMonitor)
                    {
                        NavigationLink(destination: ContentView(transMng: transMng)) {
                            Text("Show Transport location")
                        }
                    }
                    else
                    {
                        Text("No Internet Connection!")
                    }
                    
            }
                .navigationBarTitle(Text("Home"), displayMode: .inline)
            }
            
        }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(transMng: TransportManager())
    }
}
 
