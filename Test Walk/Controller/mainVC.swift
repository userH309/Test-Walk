import UIKit
import MapKit

class mainVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        //Start tracking user location.
        mapView.userTrackingMode = .follow
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        getLocation()
    }
    
    //This function will be called every time device moves 500m from last location.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Always show the new location in the console.
        print("UPDATE LOCATION:\nLAT: \(String(describing: locations.last?.coordinate.latitude))\nLON: : \(locations.last?.coordinate.longitude)\n\n")
    }
    
    func getLocation() {
        //Run if user authorize location services.
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            mapView.showsUserLocation = true
            locationManager.startMonitoringSignificantLocationChanges()
        }
    }
}

