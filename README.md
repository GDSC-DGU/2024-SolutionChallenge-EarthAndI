# 2024 - SolutionChallenge - E&I

<img src="https://github.com/GDSC-DGU/2024-SolutionChallenge-EarthAndI/assets/59119468/73cd541e-80ac-445c-8e76-85d70be7998d" alt="cover"/>

## What is E&I?

**Earth&I (E&I)** is a platform that aims to solve the problem of **people being aware of climate change, but not actually taking action to reduce their carbon emissions**.

E&I leverages the value of **`interaction`** to **make people realize that taking action on climate change is not only for the planet, but also for their own health and lives**.

With this unique approach, **`we aim to change people's perceptions and behaviors, creating a sustainable cycle and culture that positively impacts climate change action.`**

## Solution Overview

<img src="https://github.com/GDSC-DGU/2024-SolutionChallenge-EarthAndI/assets/59119468/fd06c192-5d07-4fce-b84e-15290dc2364c" alt="solution_overview"/>
<img src="https://github.com/wonho1401/2024-SolutionChallenge-EarthAndI/assets/59119468/783d272d-0875-429d-8c6d-3abab9d98c7f" alt="overview"/>

## Target UN-SDGs
<img src="https://github.com/wonho1401/2024-SolutionChallenge-EarthAndI/assets/59119468/bd92ffe2-5872-4526-8139-be30883b05d1"/>

# Application
<img src="https://github.com/wonho1401/2024-SolutionChallenge-EarthAndI/assets/59119468/bb671842-654a-4fd1-b70b-c6348e895644" alt="ui_1"/>
<img src="https://github.com/wonho1401/2024-SolutionChallenge-EarthAndI/assets/59119468/7de8cf14-cf2e-45bf-bb40-0f29101e15f1" alt="ui_2"/>
<img src="https://github.com/wonho1401/2024-SolutionChallenge-EarthAndI/assets/59119468/d579897d-ba0a-4210-8962-24cfaa1b4839" alt="ui_3"/>
<img src="https://github.com/wonho1401/2024-SolutionChallenge-EarthAndI/assets/59119468/af550ede-75c2-467a-af74-9cf3024a46f2" alt="ui_4"/>
<img src="https://github.com/wonho1401/2024-SolutionChallenge-EarthAndI/assets/59119468/3ad8e984-afe3-4195-8857-281b23ac77ba" alt="ui_5"/>
<img src="https://github.com/wonho1401/2024-SolutionChallenge-EarthAndI/assets/59119468/52d6cd91-2da1-406a-beac-1878a0e67247" alt="ui_6"/>
<img src="https://github.com/wonho1401/2024-SolutionChallenge-EarthAndI/assets/59119468/3cf18f92-982b-4e4f-9096-105e5db0ee2f" alt="ui_7"/>
<img src="https://github.com/wonho1401/2024-SolutionChallenge-EarthAndI/assets/59119468/4d801501-f835-4ac4-a778-34343d08b9e5" alt="ui_8"/>


# Project Architecture

<img src="https://github.com/GDSC-DGU/2024-SolutionChallenge-EarthAndI/assets/59119468/254a7baa-dd20-474e-a14c-47d019236bfb" alt="architecture"/>

## Tech Stack

<img src="https://github.com/GDSC-DGU/2024-SolutionChallenge-EarthAndI/assets/59119468/56931d7d-d1e6-450b-b1d7-986ea132b739" alt="tech_stack"/>

## Demo Video

### Round 1

[Click here to watch Demo Video](https://www.youtube.com/watch?v=rcZhUAFW9DA)

### Round 2

<!-- Round 2 Youtube URL -->

# Get Started

## Download

### [✨✨✨Android APK✨✨✨](https://drive.google.com/file/d/1leHanZD8JeFUPxpcQTkvwWiW0yqamuIW/view?usp=sharing)

## Client(Please [click](/app/README.md) for more information)

```sh
# Change Client Directory
cd app/

flutter pub get
flutter run

## If you encounter any issues in iOS build, follow these steps to clean your build cache for iOS
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

## If you encounter any issues in Android build, follow these steps to clean your build cache for Android
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter pub get
flutter run
```

## Server(Please [click](/server/README.md) for more information)

```sh
# Change Server Directory
cd server/

# Move to the `functions` subdirectory of quickstart-android
cd functions

# Install all of the dependencies of the cloud functions
cd functions
npm install

# Move to the `Parent Folder` subdirectory of quickstart-android
cd ../

# Select the Firebase project you have created.
firebase use -add

# Execute
firebase emulators:start --only functions
```

# GitHub Role

This repository follows the following conventions.

## Commit Convention

| Commit Type | Description                                                                |
| ----------- | -------------------------------------------------------------------------- |
| feat        | Add new features                                                           |
| fix         | Fix bugs                                                                   |
| docs        | Modify documentation                                                       |
| style       | Code formatting, missing semicolons, no changes to the code itself         |
| refactor    | Code refactoring                                                           |
| test        | Add test code, refactor test code                                          |
| chore       | Modify package manager, and other miscellaneous changes (e.g., .gitignore) |
| design      | Change user UI design, such as CSS                                         |
| comment     | Add or modify necessary comments                                           |
| rename      | Only changes to file or folder names or locations                          |
| remove      | Only performing the action of deleting files                               |

## PR Convention

| Icon | Code                       | Description                       |
| ---- | -------------------------- | --------------------------------- |
| 🧑🏻‍🎨   | :art                       | Improve code structure/formatting |
| ⚡️  | :zap                       | Performance improvement           |
| 🔥   | :fire                      | Delete code/files                 |
| 🐛   | :bug                       | Fix bugs                          |
| 🚑   | :ambulance                 | Urgent fixes                      |
| ✨   | :sparkles                  | Introduce new features            |
| 💄   | :lipstick                  | Add/modify UI/style files         |
| ⏪   | :rewind                    | Revert changes                    |
| 🔀   | :twisted_rightwards_arrows | Merge branches                    |
| 💡   | :bulb                      | Add/modify comments               |
| 🗃    | :card_file_box             | Database-related changes          |

## Contributors

|                               Client / Server                                |                                      AI                                      |                                    Design                                     |                                    Client                                    |
| :--------------------------------------------------------------------------: | :--------------------------------------------------------------------------: | :---------------------------------------------------------------------------: | :--------------------------------------------------------------------------: |
| <img src="https://avatars.githubusercontent.com/u/62001944?v=4" width=150px> | <img src="https://avatars.githubusercontent.com/u/88819145?v=4" width=150px> | <img src="https://avatars.githubusercontent.com/u/117021241?v=4" width=150px> | <img src="https://avatars.githubusercontent.com/u/59119468?v=4" width=150px> |
|               [Hyungjoon Son](https://github.com/HyungJoonSon)               |                  [Sangdon Lee](https://github.com/leeideal)                  |                [Seohyun Shim](https://github.com/shimseohyun)                 |                 [Wonho Jeong](https://github.com/wonho1401)                  |
