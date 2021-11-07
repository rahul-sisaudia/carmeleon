# Carmeleon

A new Flutter project.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Flutter: README_FLUTTER.md file with full instructions on flutter installation]
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)


## Prerequisites

This project assumes you are working on a Mac/Window/Linux OS.

## IDE

This has been primarily developed using [Android Studio](https://developer.android.com/studio), although the iOS-specific parts (like setting up Schemes) are done directly in XCode (Using the `Flutter->Open iOS module in Xcode` link in the Android Studio project menu dropdown).

## Keys

You will need to create a local keystore to sign android apps. Follow the instructions at [https://flutter.dev/docs/deployment/android]

## Run Locally

Use  the following commands to run locally.

Command :
```
flutter run 

```


--------------

## How to run the code

1. Make sure you have ios/android simulator tools installed , please look for resources mentioned in Getting started section for more details
2. Clone the repo
3. run - flutter packages get
4. run flutter run
5. Make sure to start atleast Android / Ios simulator before running 'flutter run' command

### Folder Structure
Here is the core folder structure which flutter provides.

```
carmeleon/
|- android
|- assets
|- build
|- ios
|- lib
|- test
```
Here is the core folder structure which flutter provides.
TO-DO loading local fonts from assets folder

```
assets/
|- animations
|- fonts
|- icons
|- images
```

Here is the folder structure we have been using in this project

```
lib/
|- aspects/
   |- constants
   |- enums
|- core
   |- models
   |- blocs
   |- services
   |- helpers
   |- repositories
   |- network
|- views
   |- screens
   |- widgets
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
aspect/constants - This folder needs to contain all possible constants which will be used inside throughout the app.
All constant files inside this folder must need to have the suffix “_constants”.
aspect/enums - Any application level enums
core - All the application interfacing with backend apis has been organized here
core/helpers - Helpers widgets and methods for usage across application
core/models - Interface to convert the data fetched from backend server to application compatible interfaces.
core/services - Interface for the api requests from server.
core/blocs - All business logic component.
views - All the flutter widgets organisation has been integrated here
views/screens - All screens which are visible on application shall be available here
views/widgets - All reusable widgets specific to a view would be moved in here, for non-cluttering of the code.
main.dart - main file for registering the application with dart in prod mode
```
