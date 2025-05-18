## Phobia Monitor: 
is an application for confronting phobias using modern technologies through virtual reality simulation. A person with a phobia can face all fears and challenging situations in a virtual world free from real dangers.

---
## Features:

- Allows individuals with phobias to practice self-training by repeating scenarios.

- Enables unlimited training sessions at any time to confront challenging situations.

- Completely cost-free.

- No real-life risks, encouraging users to face their fears and work towards recovery.

- Motivates individuals to take the initiative in solving the problem, as the solution is always within reach.
---

## Pages Structure:

1. Splash Screen:

   * Displays the application title.

2. Start Screen:

   * Contains the app logo and a text field to enter the user's name.
   * The text field validates the name to ensure it is more than two characters and less than ten characters, and it should not be empty.

3. Selection Screen:

   * Prompts the user to select the type of phobia they are experiencing.

4. Explanation Screen:

   * Shows a brief description of the selected phobia.
   * When the user presses the "I am Ready" button, they are navigated to the Pre-Measurement screen.

5. Pre-Measurement Screen:

   * Provides the user with instructions, such as wearing a VR headset, to prepare for the next stage.

6. Video Exposure Screen:

   * Allows the user to select the appropriate level based on their condition.
   * Displays simulation videos that match the selected phobia (e.g., if "Public Speaking" is chosen, it will show different levels of public speaking scenarios).

7. Measurement Screen:

   * After watching the videos, the user might experience symptoms like an increased heart rate.
   * This screen provides instructions to place their finger on the camera to measure the heart rate.

8. Camera Screen:

   * Accesses the device's camera, enabling the user to place their finger on it to measure heart rate.
   * Displays whether the heart rate is within the normal range or not.

9. Results Screen:

   * Shows a brief summary of the heart rate measurement.
   * Includes a drawer menu that allows navigation back to the Start Screen and to the Measurement Screen for another test.
   ---

# dependencies:
  easy_localization: ^3.0.7+1
  google_fonts: ^6.2.1
  shared_preferences: ^2.5.3
  video_player: ^2.9.5
  carousel_slider: ^5.0.0
  camera: ^0.11.1
  ---


# The project structure:

lib/

controllers/ – Contains the Controller files.

repository/ – Contains the Repository files for data storage.

screens/ – Contains the different application screens.

theme/ – Contains the theme and color files.

assets/

images/ – Contains the images used in the project.

screenshots/ – Contains the project's screenshots.

videos/ – Contains the videos for phobia simulation.

translation/ – Contains the localization files.

---

# screenshots:
![splashscreen](assets/screenshots/screenShots/splashscreen.jpg)
![ startScreen1](assets/screenshots/screenShots/startScreen1.jpg)
![ startScreen2](assets/screenshots/screenShots/startScreen2.jpg)
![ startScreen3](assets/screenshots/screenShots/startScreen3.jpg)
![ startScreen4](assets/screenshots/screenShots/startScreen4.jpg)
![phobia_selection](assets/screenshots/screenShots/phobia_selection.jpg)
![phobia_selection2](assets/screenshots/screenShots/phobia_selection2.jpg)
![procedure_explanation](assets/screenshots/screenShots/procedure_explanation.jpg)
![pre_measurement](assets/screenshots/screenShots/pre_measurement.jpg)
![measurement](assets/screenshots/screenShots/measurement.jpg)
![video_screen](assets/screenshots/screenShots/video_screen.jpg)
![camera_screen](assets/screenshots/screenShots/camera_screen.jpg)
![result](assets/screenshots/screenShots/result.jpg)


