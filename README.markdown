# An Example Café App #

## Tools Used ##

- Ruby on Rails
- jQuery
- pjax
- Twitter Bootstrap (Admin Area)
- HAML
- SASS
- HTML5 and CSS3
- Capistrano deployment manager (config/deploy.rb)

## Features ##

### Front-End ###

- jQuery animation, slide logo in from the top of the page on page load.
- pjax requests for faster page load times.
- jQuery slideshow (MadeByMuffin)
- Specials, Eat-In and Take-Away Menus
- jQuery fades used for Eat-In/Take-Away menu
- Google Map to display location of the café
- CSS3 and HTML5, also written in Haml and Sass (Scss)
- Responsive layout

## Admin Area ###

- Secure login using NoamB's Sorcery gem (https://github.com/NoamB/sorcery), includes password resets and remember me options.
- Manage Administrators, create, edit and delete administrators.
- Manage Eat-In Menu
  - Create, edit and delete categories.
  - Create, edit and delete menu-items within categories.
  - Reorder Categories or Menu-Items using jQuery drag and drop and ajax put requests
- Manage Take-Away Menu
  - Create, edit and delete categories.
  - Create, edit and delete menu-items within categories.
  - Reorder Categories or Menu-Items using jQuery drag and drop and ajax put requests
- Manage Specials Board
  - Create, edit and delete menu-items
  - Reorder Menu-Items using jQuery drag and drop and ajax put requests
