## Flutter Firebase Starter App with email and password login

Simple Flutter login starter app with email and password using [Firebase Auth](https://firebase.flutter.dev/docs/auth/overview).  Includes sign in page, register page, forgot password page and home page.  

All forms catch errors and display error messages using snackbars.  Alerts are also in place to help user when needed. Also has show and hide password, and clear email field features.

Once a user has logged in they are logged in automatically upon app restart.  If user logs out they will need to log back in upon app restart.  

Uses GetX for state management, navigation, snackbars and alerts.

**Note:** You will need to create your own [Firebase project](https://console.firebase.google.com/) and connect it in order for this app to work.

![Login Example Demo](gif/loginExampleGif.gif)