//  ContenView.swift
//  Created by Sabrina Hoque Tuli on 30/5/21.
//
import MapKit
import SwiftUI
import CoreLocation



struct ContentView: View {
    @ObservedObject var transMng: TransportManager
    @State private var trum = false
    @State private var train = false
    @State private var express = false
    @State private var topUp = false

   // @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -37.8181755, longitude: 144.9661256), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    
    var body: some View {
        NavigationView {
            
            ZStack{
            MapView(transMng: transMng)
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    HStack {
                        
                        Toggle(isOn: $trum)
                            {
                            Text("Trum")
                                  .frame(maxWidth: .infinity, alignment: .trailing)
                            
                             }
                            .background(Color.white)
                            .onChange(of: trum) { value in
                                       // print(value)
                                if(value)
                                {
                                    transMng.showTrum = true
                                }
                                else
                                {
                                transMng.showTrum = false
                                }
                                
                                }
                           }
                    HStack {
                    
                        Toggle(isOn: $train) {
                            
                            Text("Train")
                                  .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            .background(Color.white)

                            .onChange(of: train) { value in
                                if(value)
                                {
                                    transMng.showTrain = true
                                }
                                else
                                {
                                transMng.showTrain = false
                                }
                                
                                }
                           }
                    HStack {
                    
                        Toggle(isOn: $express) {
                            
                            
                            Text("Express")
                                  .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            .background(Color.white)

                            .onChange(of: express) { value in
                                if(value)
                                {
                                    transMng.showExpress = true
                                   
                                }
                                else
                                {
                                transMng.showExpress = false
                                
                                }
                                
                                }
                           }
                    HStack {
                    
                        Toggle(isOn: $topUp) {
                            
                            Text("TopUp")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                //.background(Color.blue)
                                
                            
                              }
                        .background(Color.white)
                             
                            .onChange(of: topUp) { value in
                                if(value)
                                {
                                    transMng.showTopup = true
                                   
                                }
                                else
                                {
                                transMng.showTopup = false
                                
                                }
                                
                                }
                           }
                
                }
                
            }
           
            //.navigationBarTitle(Text(verbatim: "Home"), displayMode: .inline)
        }
    
        
           
    }
}
