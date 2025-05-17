![image alt](https://cdn.tuwaiq.edu.sa/landing/images/logo/logo-h.png)

# 📘 Riyadh Transportation App — Overview

The app provides users with transportation-related services focused on Riyadh city, including bus and metro schedules, favorites management, map viewing, and user authentication.

## 📷 Screenshots

![image alt](https://github.com/azizotbb/capstone-one/blob/e21b00f70a2800532ad589376df6a0416772cced/img.jpg)


## 🔍 Features

1. **Splash Screen:**

   - Displays the app logo and navigates to the login screen after a delay.

2. **Authentication:**

   - Sign In screen with email and password validation.
   - Sign Up screen for new user registration with form validation.
   - Localization support for multi-language (Arabic and English).

3. **Main Navigation:**

   - Uses a curved bottom navigation bar to switch between three primary screens:
   - Favorites (Bus and Metro favorites)
   - Map (Displays an image map of Riyadh transit system)
   - Search (Search for bus stations and lines)

4. **Favorites Screen:**

   - Tabbed layout to toggle between favorite buses and metros.
   - Displays favorite bus or metro lines saved by the user.

5. **Search Screen**

   - Real-time searching/filtering of bus stations.
   - Allows marking/unmarking buses as favorites from the search results.

6. **Settings Screen:**
   - Options to enable notifications, change language (English/Arabic), and logout.
   - Localization support for all UI text.

## 📦 Packages

`easy_localization`
`curved_navigation_bar`

## Tech Stack

- Flutter (latest version)
- Dart

## Installation

1.  Clone the repository:

    `https://github.com/azizotbb/capstone-one.git`

2.  Navigate to the project folder:

    `cd riyadh_transportation`

3.  Install dependencies:

    `flutter pub get`

4.  Run the app:

    `flutter run`

## Folder Structure

    lib/
    ├── controller/
    ├── screens/
    ├── style/
    ├── widgets/
    └── main.dart

## ✨ Author

- AbdulAziz Alotaibi
