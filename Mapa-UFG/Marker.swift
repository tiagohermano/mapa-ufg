//
//  Marker.swift
//  Mapa-UFG
//
//  Created by Tiago Ferreira Hermano on 22/05/17.
//  Copyright © 2017 Tiago Hermano. All rights reserved.
//

import Foundation
import GoogleMaps
import SwiftyJSON

class Marker: GMSMarker {
    
    var markers:[Marker]?
    
//    init(nome: String, descricao: String, localizacao: CLLocationCoordinate2D, icone: UIImage) {
//        super.init()
//        
//        title = nome
//        snippet = descricao
//        position = localizacao
//        
//        icon = icone
//        appearAnimation = .pop
//        
//        setIconSize(height: 40, width: 40)
//    }
    
    func createMarker(nome: String, descricao: String, localizacao: CLLocationCoordinate2D, icone: UIImage) {

        title = nome
        snippet = descricao
        position = localizacao
        
        icon = icone
        appearAnimation = .pop
        
        setIconSize(height: 40, width: 40)
    }

    private func setIconSize(height: CGFloat, width: CGFloat) {
        super.iconView?.frame.size.height = height
        super.iconView?.frame.size.width = width
    }
    
    func createMarkers(locais:JSON, categoria:String) {
        let qtdLocais = locais.arrayValue
        for local in qtdLocais {
            let marker = Marker()
            marker.createMarker(nome: local["titulo"].string!, descricao: locais["descricao"].string!, localizacao: CLLocationCoordinate2D.init(latitude: locais["latitude"].doubleValue, longitude: locais["longitude"].doubleValue), icone: UIImage(named: categoria)!)
            
            markers?.append(marker)
        }
        if let marcadores = markers {
            for marker in marcadores {
                let mapa = Map()
                marker.map = mapa.mapView
            }
        }
    }
}
