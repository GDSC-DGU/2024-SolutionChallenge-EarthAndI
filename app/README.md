# E&I Flutter Client

The README contains the initial setup and execution instructions for the client.

## Prerequisites

Before running this function, make sure you have the following:

- [Dart, Flutter installed](https://flutter-ko.dev/)
- [Firebase project app set up](https://firebase.google.com/?_gl=1*1wpq7mv*_up*MQ..*_ga*NzEyODE4MDQ5LjE3MDg4OTM3MDE.*_ga_CW55HF8NVT*MTcwODg5MzcwMC4xLjAuMTcwODg5MzcwMC4wLjAuMA..&hl=ko)
  - Must move firebase_options.dart File To `/lib/app/firebase` when it created
- [Firebase FCM(+APNs) set up ](https://firebase.google.com/docs/cloud-messaging/flutter/client?hl=ko&_gl=1*1y4het9*_up*MQ..*_ga*OTUzNjk1ODIwLjE3MDg5MTI2MzQ.*_ga_CW55HF8NVT*MTcwODkxMjYzMy4xLjAuMTcwODkxMjYzMy4wLjAuMA..)
- [Apple Health Kit/ Android Google Fit set up](https://pub.dev/packages/health)

- [Home Widget set up](https://pub.dev/packages/home_widget)

## Run

1. Clone this repository

```bash
git clone https://github.com/GDSC-DGU/2024-SolutionChallenge-EarthAndI.git
```

2. Change Directory

```bash
# Change App Directory
cd ./2024-SolutionChallenge-EarthAndI/app
```

3. Add .env File

```bash
# Add .env File
cd assets
mkdir config
touch .env
```

<strong>Fill out the following in .env </strong>

```
API_SERVER_HOST=[analysis_api Server URL]
LOG_SERVER_HOST=[trigger_and_notification_api Server URL]
```

3. Run Flutter

```bash
flutter pub get
flutter run
```

### If you encounter any issues in iOS build

4. follow these steps to clean your build cache for iOS

```bash
cd ios
rm Podfile.lock
rm Podfile
rm -rf Pods
pod cache clean --all
cd ..
flutter clean
flutter pub get
cd ios
pod install
flutter pub get
flutter run
```

### If you encounter any issues in Android build

4. follow these steps to clean your build cache for Android

```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter pub get
flutter run
```

## Environment, Dependences And Directory Structure

### Environment

- Dart SDK version: 3.2.3
- Flutter version: 3.16.6

### Dependences

- cupertino_icons: ^1.0.2
- flutter_launcher_icons: ^0.13.1
- flutter_native_splash: ^2.3.6
- flutter_dotenv: ^5.1.0
- intl: ^0.18.1
- logger: ^2.0.2+1
- get: ^4.6.6
- flutter_svg: ^2.0.9
- loading_animation_widget: ^1.2.0+4
- speech_to_text: ^6.6.0
- flutter_staggered_animations: ^1.0.0
- extended_nested_scroll_view: ^6.2.1
- get_storage: ^2.1.1
- carousel_slider: ^4.2.1
- image_picker: ^1.0.7
- table_calendar: ^3.0.9
- drift: ^2.14.1
- sqlite3_flutter_libs: ^0.5.18
- path_provider: ^2.1.2
- path: ^1.8.3
- firebase_core: ^2.25.4
- firebase_auth: ^4.17.4
- cloud_firestore: ^4.15.5
- google_sign_in: ^6.2.1
- permission_handler: ^11.2.1
- health: ^8.1.0
- rive: ^0.12.4
- animated_text_kit: ^4.2.2
- smooth_page_indicator: ^1.1.0
- home_widget: ^0.4.1
- timezone: ^0.9.2
- flutter_app_badger: ^1.5.0
- flutter_local_notifications: ^16.3.2
- firebase_messaging: ^14.7.16

### Directory Structure

```sh
├── android
├── assets
│  ├── config
│  ├── data
│  ├── fonts
│  ├── icons
│  └── images
├── build
├── ios
├── lib
│  ├── apps
│  ├── bindings
│  ├── domains
│  ├── middlewares
│  ├── models
│  ├── providers
│  ├── repositories
│  ├── utilities
│  ├── view_models
│  ├── views
│  └── widgets
└────── main.app
```
