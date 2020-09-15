//
//  MapNetApi.swift
//  MarkedMapCore
//
//  Created by Jose Luis Fernandez on 15/09/2020.
//  Copyright © 2020 joseluisfdezbueno. All rights reserved.
//

import RxSwift

class MapNetApi {
    
    init() { }
    
    public func getPointsOfInterest() -> Observable<[PointOfInterestModel]> {
        let request = MapNetRequestProvider.getPointsOfInterestRequest()
        return URLRequest.request(resource: request)
    }
    
}
