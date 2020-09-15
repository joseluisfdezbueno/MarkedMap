//
//  MapViewController.swift
//  MarkedMap
//
//  Created by Jose Luis Fernandez on 13/09/2020.
//  Copyright © 2020 joseluisfdezbueno. All rights reserved.
//

import UIKit
import GoogleMaps
import RxSwift
import RxCocoa
import MarkedMapCore

protocol MapViewControllerProtocol: UIViewController {
    func paintPointsOfInterest(pois: [PointOfInterestModel])
    func showDefaultAlert()
}

class MapViewController: UIViewController, MapViewControllerProtocol {

    @IBOutlet var mapView: GMSMapView!
    @IBOutlet var centerMapButton: UIButton!
    
    private let centerCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: (38.739429 + 38.711046) / 2, longitude: (-9.137115 + -9.160096) / 2)
    private let defaultZomm: Float = 17

    // Preloaded icons to improve performance
    private let publicTrasnportMarkerImage: UIImage = GMSMarker.markerImage(with: UIColor.appColor(.publicTransportColor))
    private let publicTrasnport2MarkerImage: UIImage = GMSMarker.markerImage(with: UIColor.appColor(.publicTransport2Color))
    private let publicTrasnport3MarkerImage: UIImage = GMSMarker.markerImage(with: UIColor.appColor(.publicTransport3Color))
    private let electricCarMarkerImage: UIImage = GMSMarker.markerImage(with: UIColor.appColor(.electricCarColor))
    private let mopedMarkerImage: UIImage = GMSMarker.markerImage(with: UIColor.appColor(.mopedColor))
    private let bikeMarkerImage: UIImage = GMSMarker.markerImage(with: UIColor.appColor(.bikeColor))
    
    private let disposeBag = DisposeBag()
    var presenter: MapPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.mapView.camera = GMSCameraPosition(target: self.centerCoordinate, zoom: self.defaultZomm)
        self.presenter?.getPointsOfInterest()
    }
    
    private func setUpView() {
        self.centerMapButton.rx.tap.bind {
            self.centerMap()
        }.disposed(by: self.disposeBag)
    }
    
    private func centerMap() {
        self.mapView.animate(toLocation: self.centerCoordinate)
        self.mapView.animate(toBearing: 0)
        self.mapView.animate(toZoom: self.defaultZomm)
    }
    
    private func createMarker(latitude: Double, longitude: Double, title: String, icon: UIImage) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let marker = GMSMarker(position: coordinate)
        marker.map = self.mapView
        marker.title = title
        marker.appearAnimation = .pop
        marker.icon = icon
    }
    
    private func getMarkerIcon(companyZone: CompanyZoneType) -> UIImage {
        switch companyZone {
            case .PUBLIC_TRANSPORT:
                return self.publicTrasnportMarkerImage
            case .PUBLIC_TRANSPORT_2:
                return self.publicTrasnport2MarkerImage
            case .PUBLIC_TRANSPORT_3:
                return self.publicTrasnport3MarkerImage
            case .ELECTRIC_CAR:
                return self.electricCarMarkerImage
            case .MOPED:
                return self.mopedMarkerImage
            case .BIKES:
                return self.bikeMarkerImage
        }
    }
    
}

// MARK: - Internal Methods

extension MapViewController {
    
    func paintPointsOfInterest(pois: [PointOfInterestModel]) {
        pois.forEach { poi in
            DispatchQueue.main.async {
                self.createMarker(latitude: poi.latitude, longitude: poi.longitude, title: poi.name, icon: self.getMarkerIcon(companyZone: poi.companyZoneType))
            }
        }
    }
    
}
