# Patient Friendly Costs of Care POC

patient friendly costs of care is an iOS and Android app build with Flutter. 

The app is a personal healthcare helper that allows you to find nearest patient friendly costs of care by scraping healthcare details from the official sites.

<p align="center">
  <img src="https://github.com/ShashankSirmour/GSOC-POC/raw/screenshots/img1.jpg" width="250"/>
  <img src="https://github.com/ShashankSirmour/GSOC-POC/raw/screenshots/img2.jpg" width="250"/>
  <img src="https://github.com/ShashankSirmour/GSOC-POC/raw/screenshots/img3.jpg" width="250"/>
</p>

### Download the app

##### Android APK:

<a href='https://dl.getdropbox.com/s/lj44tcmh978z0s3/care.apk'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png' width="170"/></a>


### Motivations

Just think of a situation where a patient needs to find nearest clinic which comes under their budget having almost best facility but cost wise effective for that  they need to scroll all the healthcare information which took a lot of effort.

So that’s where the Android mobile application to show patient friendly costs of care
idea comes from. The care-seeking patient can simply open app connected to already updated crawled database and set location and filters and wait for the well filtered required data to find nearest in budget health care.

### Technical details

The app is made with Flutter with the following tech stack:
- Flutter: [https://flutter.io/](https://flutter.io/)
 
#### packages used

  - cupertino_icons: ^0.1.2
  - bubble_bottom_bar: ^1.2.0
  - auto_size_text: ^2.1.0
  - maps_launcher: ^1.2.0 


### Data provider

Care data is coming from the Djnado API [need to create]

api call needed 
```
location:
    -lang :longitude
    -lati :latitude
nearby:
    -underKM :under how much KM to search
query:
    -search :query search
```

in app model used for Prototype

Care
    - to stoe hostpital name and ifo
    - longitude ,latitude
    - cost of care

## Run the App
MemeChat can be run like any other Flutter app, either through the IntelliJ UI or through running the following command from within the MemeChat directory:

```
flutter run
```