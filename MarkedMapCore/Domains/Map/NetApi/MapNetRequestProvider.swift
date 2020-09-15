//
//  MapNetRequestProvider.swift
//  MarkedMapCore
//
//  Created by Jose Luis Fernandez on 15/09/2020.
//  Copyright © 2020 joseluisfdezbueno. All rights reserved.
//

class MapNetRequestProvider {

    private static let pointsOfInterestEndpoint = "https://apidev.meep.me/tripplan/api/v1/routers/lisboa/resources?lowerLeftLanLon=38.711046,-9.160096&upperRightLatLon=38.739429,-9.137115"
    
    static func getPointsOfInterestRequest() -> Resource<[PointOfInterestModel]> {
        let request = Resource<[PointOfInterestModel]>(url: URL(string: self.pointsOfInterestEndpoint)!)
        return request
    }

}
