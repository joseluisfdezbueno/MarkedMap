//
//  MapPresenter.swift
//  MarkedMap
//
//  Created by Jose Luis Fernandez on 15/09/2020.
//  Copyright © 2020 joseluisfdezbueno. All rights reserved.
//

import RxSwift
import MarkedMapCore

protocol MapPresenterProtocol: class {
    func getPointsOfInterest()
}

class MapPresenter: MapPresenterProtocol {

    private weak var view: MapViewControllerProtocol!
    private lazy var mapService: MapServiceProtocol = DefaultCoreFactory.shared.getMapService()
    private let disposeBag = DisposeBag()

    init(view: MapViewControllerProtocol) {
        self.view = view
    }
    
    func getPointsOfInterest() {
        self.mapService.getPointsOfInterest().subscribe(onNext: { pois in
            self.view.paintPointsOfInterest(pois: pois)
        }, onError: { error in
            self.view.showDefaultAlert()
        }).disposed(by: self.disposeBag)
    }

}
