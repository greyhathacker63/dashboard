# dashboard

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Dashboad

This is a Flutter application designed to display information about various AI topics in a dynamic and customizable way. Users can browse information cards, expand them for more details, and personalize the app's appearance directly from a dedicated settings page. The app also features persistence for user settings and a loading indicator for network images.

✨ Features
Dynamic Information Display: Presents AI-related information in an intuitive grid layout.

Expandable Cards: Each information card can be expanded to reveal a long description.

Customizable App Settings:

Adjust colors (primary, accent, app bar, card text, button colors).

Modify font sizes (app bar title, card title, descriptions).

Control spacing (card margins, grid spacing, image-text spacing).

Tweak sizes (card image height, card aspect ratio, icon sizes).

Configure card and button properties (elevation, border radius).

Settings Persistence: Your customized app settings are saved locally and persist across app restarts.

Reset to Default: A convenient button on the settings page allows users to revert all settings to their original values defined in assets/config.json.

Image Loading with Loader: Network images now display a circular progress indicator while loading, enhancing the user experience.

Error Handling: Displays a user-friendly message and a retry option if information fails to load.

Responsive UI: The layout adapts to different screen sizes, providing an optimal viewing experience on various devices.


Technologies Used

This project leverages several key Flutter packages to deliver its features:

Bloc: A popular state management library that helps separate the business logic from the UI, making the app more scalable and testable.

Equatable: Used in conjunction with Bloc, this package simplifies value equality checks for Dart objects, reducing boilerplate code for comparing states and events.

Google Fonts: Provides easy integration of custom fonts from the Google Fonts library, allowing for flexible typography.

Shared Preferences: A Flutter plugin for reading and writing simple key-value pairs to persistent storage. This is used to save and load user-defined app settings locally on the device.