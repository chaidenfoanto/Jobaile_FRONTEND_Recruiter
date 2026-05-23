# Jobaile_FRONTEND_Recruiter

[![Contributors][contributors-shield]](https://github.com/chaidenfoanto/Jobaile_FRONTEND_Recruiter/graphs/contributors)

[contributors-shield]: https://img.shields.io/github/contributors/chaidenfoanto/Jobaile_FRONTEND_Recruiter.svg?style=for-the-badge]

[![LinkedIn Franklin Jaya][linkedin-shield]](https://www.linkedin.com/in/franklin-jaya-6a3697364/)
[![LinkedIn Chaiden][linkedin-shield]](https://www.linkedin.com/in/chaidenfoanto/?locale=en)

[linkedin-shield]: https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white



<!-- PROJECT LOGO -->
<br />


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

There are many great README templates available on GitHub; however, I didn't find one that really suited my needs so I created this enhanced one. I want to create a README template so amazing that it'll be the last one you ever need -- I think this is it.

Here's why:
* Your time should be focused on creating something amazing. A project that solves a problem and helps others
* You shouldn't be doing the same tasks over and over like creating a README from scratch
* You should implement DRY principles to the rest of your life :smile:

Of course, no one template will serve all projects since your needs may be different. So I'll be adding more in the near future. You may also suggest changes by forking this repo and creating a pull request or opening an issue. Thanks to all the people who have contributed to expanding this template!

Use the `BLANK_README.md` to get started.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

This backend project was built with php followingg technologies:

* [![Laravel][Flutter.dev]][Flutter-url]

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

Follow these steps to set up the laravel project locally

### Prerequisites

Make sure you have installed the following software:

- PHP 8.2+
- Composer
- Git
- MySQL 

Check your installation:

```sh
php --version
composer --version
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
composer install
```

4. Copy the environment configuration file

```sh
cp .env.example .env
```

**Windows (PowerShell)**

```powershell
copy .env.example .env
```

5. Generate the Laravel application key

```sh
php artisan key:generate
```

6. Configure your database in the `.env` file

Example:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database
DB_USERNAME=root
DB_PASSWORD=
```

7. Run database migrations

```sh
php artisan migrate
```

8. Start the Laravel development server

```sh
php artisan serve
```

The backend server will run at:

```txt
http://127.0.0.1:8000
```

---

<!-- USAGE EXAMPLES -->
## Usage

This project consists of two separate repositories:

- Frontend (Flutter)
- Backend (Laravel API)

Repository Links:
- Frontend: https://github.com/chaidenfoanto/Jobaile_FRONTEND_Recruiter
- Backend: https://github.com/chaidenfoanto/Jobaile_BACKEND

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Franklin Jaya - [@franklinjaya_](https://www.instagram.com/franklinjaya_/) - franklinjaya827@gmail.com

Project Link: [https://github.com/chaidenfoanto/Jobaile_BACKEND)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Flutter.dev]: https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=fff
[Flutter-url]: https://flutter.dev
