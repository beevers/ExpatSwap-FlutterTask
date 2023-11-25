# expatswap_fluttertask

A new Flutter task project from ExpatSwap.

## Getting Started

This project is a starting point for a Flutter application.

## Description

Flutter mobile app that allows users to input and submit personal information through a form. This app support authentication using Google, and the submitted data is stored in firestore database.


## Table of Contents

- [Running the App Locally](#running-the-app-locally)
- [How To Setup Authentication And Connect To Database](#how-to-setup-authentication-and-connect-to-database)
- [App Purpose](#app-purpose)

## Installation
### Firstly clone my project running the command below in your terminal then open in vscode
git clone https://github.com/beevers/ExpatSwap-FlutterTask.git
### run command below in terminal
code .
### Install Dependencies by running the command below in your terminal 
flutter pub get
### App is ready to run on emulator or physical devices
Setup your device then run the command - flutter run

## How To Setup Authentication And Connect To Database
### Setting up Authentication with Google
Before setting up Google Authentication, ensure you have the necessary dependencies installed in your Flutter project.- -  -firebase_core: ^latest_version\
-firebase_auth: ^latest_version
-google_sign_in: ^latest_version
### Firebase Project Setup
Go to the Firebase Console and create a new project.
Add your Android and iOS apps to the Firebase project and follow the setup instructions to download the configuration files (google-services.json for Android and GoogleService-Info.plist for iOS).
Enable Google authentication in the Firebase Authentication section of the Firebase Console.
### Implement Google Sign-In
Use the signInWithGoogle function where you want to initiate Google Sign-In.

## Connecting to Firestore Database
Ensure you have the cloud_firestore dependency in your pubspec.yaml:
### Firestore Setup
-In the Firebase Console, enable Firestore for your project.
-Create a Firestore database and set up the necessary collections.
### Flutter Code Integration 
Initialize Firestore in your app, then create a collection instance, then we have successfully connected with firestore database.

## App Purpose
-Authenticate users to ensure that they are who they claim to be.
-Enhances security and prevents unauthorized access to sensitive information or features within your app.
-Users can sign in with their Google credentials, reducing the need for them to create and remember another set of login credentials.
-to assess my skills
