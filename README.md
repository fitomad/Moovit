# Moovit
Moovit Deep Linking wrapper written in Swift

## Ejemplo
Veamos como solicitar a **Moovit** que calcule la ruta entre dos puntos.

```swift
if Moovit.sharedInstance.available
{
    let from: CLLocationCoordinate2D = Moovit.sharedInstance.coordinateFromLatitude(40.411237, longitude: -3.708392)
    let to: CLLocationCoordinate2D = Moovit.sharedInstance.coordinateFromLatitude(40.423856, longitude: -3.711398)
    
    Moovit.sharedInstance.getDirections(fromLocation: from, toLocation: to)
}
```

## Ejecutar con iOS 9
Si vas a usar los *deeplinks* en un dispositivo con iOS 9 primero debes autorizar el esquema de Moovit en tu app. Para ello dirígite al archivo **Info.plist** y añade código que aparece a continuación

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
   <string>moovit</string>
</array>
```

