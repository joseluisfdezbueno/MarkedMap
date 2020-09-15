//
//  MapService.swift
//  MarkedMapCore
//
//  Created by Jose Luis Fernandez on 15/09/2020.
//  Copyright © 2020 joseluisfdezbueno. All rights reserved.
//

import RxSwift

public class MapService: MapServiceProtocol {

    private let netApi: MapNetApi

    public init() {
        self.netApi = MapNetApi()
    }
    
    public func getPointsOfInterest() -> Observable<[PointOfInterestModel]> {
        return self.netApi.getPointsOfInterest()
    }

}
