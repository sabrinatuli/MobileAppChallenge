//
//  MapView.swift
//  Created by Sabrina Hoque Tuli on 30/5/21.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    @State private var showGreeting = false
    @ObservedObject var transMng: TransportManager
    @State var mapView = MKMapView()
    
    
    
    //var annotations: [MKPointAnnotation]
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
                //print(mapView.centerCoordinate)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
 
        
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIView(context: Context) -> MKMapView {
        
        mapView.delegate = context.coordinator
        //mapView.centerCoordinate = CLLocationCoordinate2D(latitude: -37.8181755, longitude: 144.9661256)
        let coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -37.8181755, longitude: 144.9661256), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
        mapView.setRegion(coordinateRegion, animated: true)

        
        return mapView
    }
    

    func updateUIView(_ view: MKMapView, context: Context) {
        
            print("Updating map")
            view.delegate = context.coordinator
            mapView.removeAnnotations(mapView.annotations)
            var pinsArray : [MKPointAnnotation] = []
            
            for i in 0...(transMng.trans.count-1)
            {
                let pointAnnotation = MKPointAnnotation()
                
                /****  filter show or hide trum/train/express/topup **/
                    
                    if (transMng.showTrum) {
                        // only trum or trum & express or all
                        if (transMng.trans[i].typeId == 1)
                        {
                        pointAnnotation.title = transMng.trans[i].name + " (Tram)"
                        pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: transMng.trans[i].latitude, longitude: transMng.trans[i].longitude)
                        pointAnnotation.subtitle = transMng.transportDateFormat(itemdate: transMng.trans[i].departureTime)

                        pinsArray.append(pointAnnotation)
                        }
                        if (transMng.trans[i].isExpress ?? false && transMng.showExpress && !transMng.showTrain)
                        {
                            pointAnnotation.title = transMng.trans[i].name + " (Train)"
                                pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: transMng.trans[i].latitude, longitude: transMng.trans[i].longitude)
                                pointAnnotation.subtitle = transMng.transportDateFormat(itemdate: transMng.trans[i].departureTime)

                                pinsArray.append(pointAnnotation)
                        }
                        if (transMng.trans[i].typeId == 0 && transMng.showTrain)
                        {
                        pointAnnotation.title = transMng.trans[i].name + " (Train)"
                        pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: transMng.trans[i].latitude, longitude: transMng.trans[i].longitude)
                        pointAnnotation.subtitle = transMng.transportDateFormat(itemdate: transMng.trans[i].departureTime)

                        pinsArray.append(pointAnnotation)
                        }
                        
                    }
                    else if (transMng.showTrain)
                    {
                        //only train or train & topup
                        if (transMng.trans[i].typeId == 0)
                        {
                        pointAnnotation.title = transMng.trans[i].name + " (Train)"
                        pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: transMng.trans[i].latitude, longitude: transMng.trans[i].longitude)
                        pointAnnotation.subtitle = transMng.transportDateFormat(itemdate: transMng.trans[i].departureTime)

                        pinsArray.append(pointAnnotation)
                        }
                        if (transMng.trans[i].hasMyKiTopUp ?? false && transMng.showTopup && !transMng.showTrum )
                        {
                            pointAnnotation.title = transMng.trans[i].name + " (Tram)"
                            pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: transMng.trans[i].latitude, longitude: transMng.trans[i].longitude)
                            pointAnnotation.subtitle = transMng.transportDateFormat(itemdate: transMng.trans[i].departureTime)

                            pinsArray.append(pointAnnotation)
                            
                        }
                    }
                    
                    else if (transMng.showTopup)
                    {
                        //only topup
                        if (transMng.trans[i].hasMyKiTopUp ?? false )
                        {
                            pointAnnotation.title = transMng.trans[i].name + " (Tram)"
                            pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: transMng.trans[i].latitude, longitude: transMng.trans[i].longitude)
                            pointAnnotation.subtitle = transMng.transportDateFormat(itemdate: transMng.trans[i].departureTime)

                            pinsArray.append(pointAnnotation)
                            
                        }
                    }
                    else if (transMng.showExpress)
                    {
                        //only express
                        if (transMng.trans[i].isExpress ?? false)
                        {
                            pointAnnotation.title = transMng.trans[i].name + " (Train)"
                                pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: transMng.trans[i].latitude, longitude: transMng.trans[i].longitude)
                                pointAnnotation.subtitle = transMng.transportDateFormat(itemdate: transMng.trans[i].departureTime)

                                pinsArray.append(pointAnnotation)
                        }
                    }
                    else
                    {
                        
                        if transMng.trans[i].typeId == 0 {
                            pointAnnotation.title = transMng.trans[i].name + " (Train)"
                        }
                        else
                        {
                        pointAnnotation.title = transMng.trans[i].name + " (Tram)"
                        }
                        //print(transMng.trans[i].name)
                        pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: transMng.trans[i].latitude, longitude: transMng.trans[i].longitude)
                        pointAnnotation.subtitle = transMng.transportDateFormat(itemdate: transMng.trans[i].departureTime)

                        pinsArray.append(pointAnnotation)
                        
                    }
                    
               
            }
        print(pinsArray.count)
            mapView.addAnnotations(pinsArray) // Add all the annotations to map view at once.
            
        }

}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(transMng: TransportManager())
    }
}

 
 
