//
//  Moovit.swift
//  Moovit Helper
//
//  Created by Adolfo Vera Blasco on 08/03/16.
//  Copyright © 2016 Adolfo Vera Blasco. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

///
/// Moovit Helper.
///
/// Más información en la [web de desarrolladores](http://www.developers.moovitapp.com/#!deeplinking-docs/on53h)
/// de *Moovit*.
///
public class Moovit
{
    /// El nombre de tu app.
    /// Se usa para informatión estadística por
    /// parte de **Moovit**
    private let myAppName: String = "<YOUR_APP_NAME_HERE>"
    
    /// Singleton
    public static let sharedInstance: Moovit = Moovit()
    
    /// Indica si la app está instalada
    public var available: Bool
        {
            let appURL: NSURL = NSURL(string: "moovit://")!
            return UIApplication.sharedApplication().canOpenURL(appURL)
    }
    
    /**
        Muestras las líneas y estaciones más cercanas a la
        posición actual del usuario.
     
        - SeeAlso: `func nearby(_:) -> Void`
     */
    public func nearby() -> Void
    {
        let link: String = "moovit://nearby?partner_id=\(self.myAppName)"
        self.openLink(link)
    }
    
    /**
        Muestra las líneas y estaciones más cercanas a las
        coordenadas suministradas por parámetro
     
        - Parameter coordinate: Localización para la que queremos obtener
            la información
     
        - SeeAlso: `func nearby() -> Void`
    */
    public func nearby(coordinate: CLLocationCoordinate2D) -> Void
    {
        let link: String = "moovit://nearby?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&partner_id=\(self.myAppName)"
        self.openLink(link)
    }
    
    /**
        Obtiene las indicaciones para llegar a la posición
        que se pasa por parámetro desde la ubicación **actual**
        del usuario.
     
        - Parameter coordinate: El lugar al que queremos llegar
     
        - SeeAlso:
            - `func getDirectionsFromLocation(_:) -> Void`
            - `func getDirections(_:, toLocation:) -> Void`
    */
    public func getDirectionsToLocation(coordinate: CLLocationCoordinate2D) -> Void
    {
        let link: String = "moovit://directions?dest_lat=\(coordinate.latitude)&dest_lon=\(coordinate.longitude)&partner_id=\(self.myAppName)"
        self.openLink(link)
    }
    
    /**
        Obtiene las indicaciones para llegar a la ubicación
        **actual** del usuario desde las coordenadas que se pasan
        como parámetro.
     
        - Parameter coordinate: Desde donde parte la ruta.
     
        - SeeAlso:
            - `func getDirectionsToLocation(_:) -> Void`
            - `func getDirections(_:, toLocation:) -> Void`
    */
    public func getDirectionsFromLocation(coordinate: CLLocationCoordinate2D) -> Void
    {
        let link: String = "moovit://directions?orig_lat=\(coordinate.latitude)&orig_lon=\(coordinate.longitude)&partner_id=\(self.myAppName)"
        self.openLink(link)
    }
    
    /**
        Obtiene las indicaciones para completar una ruta.
     
        - Parameters:
            - fromLocation: Salimos de aquí...
            - toLocation: ...y llegamos aquí.
     
        - SeeAlso:
            - `func getDirectionsToLocation(_:) -> Void`
            - `func getDirectionsFromLocation(_:) -> Void`
    */
    public func getDirections(fromLocation from: CLLocationCoordinate2D, toLocation to: CLLocationCoordinate2D) -> Void
    {
        let link: String = "moovit://directions?dest_lat=\(to.latitude)&dest_lon=\(to.longitude)&orig_lat=\(from.latitude)&orig_lon=\(from.longitude)&partner_id=\(self.myAppName)"
        self.openLink(link)
    }
    
    /**
        Descarga las aplicación **Moovit** desde la *App Store*
     */
    public func downloadMoovit() -> Void
    {
        let link: String = "https://app.appsflyer.com/id498477945?pid=DL&c=\(self.myAppName)"
        self.openLink(link)
    }
    
    /**
        Crea un `CLLocationCoordinate2D` a partir de una
        longitud y latitud dadas.
     
        - Parameters:
            - latitude: La latitud del lugar...
            - longitude: ...y su longitud.
     
        - Returns: Una estructura de coordenadas usada por `CoreLocation`
    */
    public func coordinateFromLatitude(latitude: Double, longitude: Double) -> CLLocationCoordinate2D
    {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    /**
        Abre todos los enlaces comprobando primero si es posible.
        Quién sabe, lo mismo han desinstalado **Moovit** desde la 
        petición anterior...
     
        - Parameter link: El recurso que queremos abrir
     
        - SeeAlso: Propiedad `available`
    */
    private func openLink(link: String) -> Void
    {
        let url: NSURL = NSURL(string: link)!
        
        if UIApplication.sharedApplication().canOpenURL(url)
        {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}

