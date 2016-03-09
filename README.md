# Moovit
Moovit Deep Linking wrapper written in Swift

## Ejecutar con iOS 9
Si vas a usar los *deeplinks* en un dispositivo con iOS 9 primero debes autorizar el esquema de Moovit en tu app. Para ello dirígite al archivo **Info.plist** y añade código que aparece a continuación

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
   <string>moovit</string>
</array>
```

