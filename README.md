# Jobaile_FRONTEND_Recruiter

[![Contributors](https://img.shields.io/github/contributors/chaidenfoanto/Jobaile_FRONTEND_Recruiter?style=for-the-badge)](https://github.com/chaidenfoanto/Jobaile_FRONTEND_Recruiter/graphs/contributors)

[contributors-shield]: https://img.shields.io/github/contributors/chaidenfoanto/Jobaile_FRONTEND_Recruiter.svg?style=for-the-badge]

[![LinkedIn Franklin Jaya](https://img.shields.io/badge/LinkedIn-Franklin%20Jaya-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/franklin-jaya-6a3697364/) [![LinkedIn Chaiden](https://img.shields.io/badge/LinkedIn-Chaiden-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/chaidenfoanto/?locale=en) [![LinkedIn Felicia Wijaya](https://img.shields.io/badge/LinkedIn-Felicia%20Wijaya-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/felicia-wijaya-a9a795288/)

[linkedin-shield]: https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white



<!-- PROJECT LOGO -->
<p align="center">
  <img src="jobailelogo.png" width="250">
</p>
<br />

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#project-dependencies">Project Dependencies</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#build-apk">Build APK</a></li>
        <li><a href="#verify-flutter-installation">Verify Flutter Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#Development-Team">Development Team</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<p align="center">
  <img src="mokupjobaile.png" width="250">
</p>

Jobaile is a mobile and web-based recruitment platform designed to connect recruiters with domestic workers such as housemaids (ART), caregivers, cleaners, and other household service providers.

The application was developed to help address trust issues that are still common in domestic worker recruitment processes. Many employers experience difficulties in finding reliable workers, while workers also struggle to access secure and trustworthy job opportunities.

Jobaile provides a digital platform that simplifies the recruitment process through user verification, worker profiles, communication features, and job matching systems.

The system consists of two main roles:

### Recruiter
Recruiters or employers can:

- Search for domestic workers
- View worker profiles and information
- Monitor application status
- Communicate with workers
- Find workers that match their requirements

### Worker
Workers can:

- Create professional profiles
- Apply for available jobs
- Showcase skills and experiences
- Receive job opportunities from recruiters
- Build credibility through profile information

Main features include:

- Domestic worker recruitment platform
- Recruiter and worker role management
- Real-time communication features
- Profile and identity management
- Job searching and matching system
- Mobile-friendly user experience
- Secure authentication system

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

This frontend project was built with the following technologies:

<a href="https://flutter.dev/">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" height="35">
</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Project Dependencies

This Flutter project uses the following packages:

```yaml
dependencies:
  flutter:
    sdk: flutter

  # iOS style icons
  cupertino_icons: ^1.0.6

  # Local database
  objectbox: ^4.2.0
  objectbox_flutter_libs: any

  # Persistent storage
  shared_preferences: ^2.5.3

  # Animations
  lottie: ^3.3.1

  # Location services
  geolocator: ^14.0.1

  # Fonts
  google_fonts: ^6.2.1

  # State management
  flutter_bloc: ^9.1.1

  # Routing
  go_router: ^15.1.3

  # Input validation
  intl_phone_number_input: ^0.7.4

  # SVG rendering
  flutter_svg: ^2.1.0

  # Rating widget
  flutter_rating_bar: ^4.0.1

  # Equality checks for Bloc
  equatable: ^2.0.5

  # HTTP requests
  http: ^1.4.0

  # Internationalization
  intl: ^0.19.0

  # Meta annotations
  meta: ^1.11.0
```

---

## Getting Started

Follow these steps to set up the Flutter frontend project locally.

### Prerequisites

Make sure you have installed the following software:

- Flutter SDK
- Dart SDK
- VS Code
- Git

Check your installation:

```sh
flutter --version
dart --version
git --version
```

---

### Installation

1. Clone the repository

```sh
git clone https://github.com/your_username/your_repository.git
```

2. Navigate to the project folder

```sh
cd your_repository
```

3. Install project dependencies

```sh
flutter pub get
```

4. Run the Flutter application

```sh
flutter run
```

---

### Build APK

To generate a release APK:

```sh
flutter build apk --release
```

Generated APK location:

```txt
build/app/outputs/flutter-apk/app-release.apk
```

---

### Verify Flutter Installation

```sh
flutter doctor
```

If installed correctly, Flutter will display your environment status and connected devices.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

This project consists of two separate repositories:

- Frontend (Flutter)
- Backend (Laravel API)

Repository Links:
- Frontend Recruiter: https://github.com/chaidenfoanto/Jobaile_FRONTEND_Recruiter
- Backend: https://github.com/chaidenfoanto/Jobaile_BACKEND

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Franklin Jaya - [@franklinjaya_](https://www.instagram.com/franklinjaya_/) - franklinjaya827@gmail.com - [Franklin_Github](https://github.com/FranklinJaya2006)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Development Team

This Project are developed by **Jobaile Development Team**, which consist of three people:

1. **Chaiden Richardo Foanto**  
2. **Franklin Jaya** 
3. **Felicia Wijaya** 


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Flutter.dev]: https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=fff
[Flutter-url]: https://flutter.dev
