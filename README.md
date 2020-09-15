# MarkedMap

Example App using Google Maps SDK for iOS. Using google markers for painting points of interest such as bus stop, emovs, bikes, etc.

MarkedMap App was developed in **Swift5 with RxSwift and GoogleMaps SDK. Following a reactive architecture, communication between interfaces, dependency injection and separation between business logic and view**. 
  
   
   ![alt text](https://github.com/joseluisfdezbueno/MarkedMap/blob/master/Docs/marker_map_app_screen.png). 
   
   
# Architecture
The used architecture separates the view from the business logic. For this, we find two targets; the application target (the visual part), and the core target (business logic). Doing this we also can reuse business logic with other targets such as apple watch extension, today extension, etc. Another advantage is the improvement in compilation time, because we can compile only specifics targets, for example the one we have edited.


### App´s Target
Inside App´s target, each shown screen is encapsulated in a module. A module contains a view and its associated "presenter". The presenter is in charge of the communication with the Core, and provides the data to the view when it is needed.


   ![alt text](https://github.com/joseluisfdezbueno/MarkedMap/blob/master/Docs/app_target_folders.png). 
  
  
### Core´s Target
In the Core´s target, we find the business logic of the application; as well as data management, such as calls to api rest, local database management, etc.

The Core follows a DDD structure (Domain Drive Development), where business logic is encapsulated for each specific domain.

The entry point of a domain is a class called {DomainName}Service, for example: MapService. The services execute the business logic for its domain. The service is also responsible for data management:

  - If a service needs to communicate with a net api, then the service will have a class called {DomainName}NetApi which is responsible for communicating with the network apis.

  - If a service needs to get / save data in a local database, then the service will have a class called {DomainName}Respository which is responsible for manage the data in the database.


   ![alt text](https://github.com/joseluisfdezbueno/MarkedMap/blob/master/Docs/core_target_folders.png). 


# External Libraries
The following external libraries have been used for this project: 

  - RxSwift: ReactiveX implementation in Swift for iOS / macOS enviroment

  - GoogleMaps: This SDK automatically handles access to the Google Maps servers, map display, and response to user gestures such as clicks and drags, etc.
