# TALON AGENCY - Encrypted Request Manager

## Table of Contents

> Project, Project Summary 
> TalonsOut Team Members
> Tools Used
> Sprint Deliverables from 2/10 (First Sprint) - 5/06 (Last Sprint)  

MSU Denver Senior Project for CS4360, Spring 2021. 

We are building a Web-App that allows its clients to make encrypted service requests.

## TalonsOut Team Members:

- Dominick Licciardi (Product Owner)

- Warren Joseph Ramos (Scrum Master)

- Stuart Griffin (Development Team)

- Muhammad Mansoor (Development Team)

- Grant Schumacher (Development Team)

- Ian Mutahi (Development Team)

- Jose Velasquez (Development Team)

## Tools Used

- Ruby on Rails: a familiar and robust framework that allows the team to quickly and easily work in an MVC environment

- Test Driven Development Approach: this project implements a TDD approach to ensure code quality and integrity

- PostGreSQL Database: a free and popular relational database management system that will allow the project to be deployed to Heroku

- Travis CI: allows for continuous integration to maintain code quality and integrity

## Sprint Deliverables - 2/10

- Basic app working with minimal features (3 scaffolds/pages)
- basic front-end features (bootstrap, HTML)
- Unit Testing (passing) and Field Validations (bin/rails test:system)
- SimpleCov (passing)
- Travis-CI (passing)
- all hosted on Heroku.

## Sprint Deliverables - 2/24

- Researched, Implemented and Tested Authentication - Auth0 add on created through Heroku
- Added HTML5 elements for screen readers to access the landmark features on Web Pages
- Decided to Utilize Minitest to test Auth0
- Designed Logo and Color Scheme for Talon Agency

## Sprint Deliverables - 3/10

- Added a User Profile to the Web Application
- Added content such as the nav bar, the footer, the sign in and also the sign out button
- Created a style guide that finalized the style of fonts, buttons, colors etc for the web app. 
- Implemented and fixed associations: 
  The client should be able to choose which services they want from the firm requests page; The administrator should be able to see and also edit the client's request
  
## Sprint Deliverables - 3/31 

- Made major front end style enhancements and visual updates to the Web App; made the styling consistent with every page and created styling guidelines for all of the pages that will follow afterwards
- Made the navbar buttons collapse into a hamburger menu when the screen is made smaller
- Converted our Secrets.yml Page to credentials.yml
- Created a HTTPS domain for the Web App, 
- Made all of the services appear in a vertical list on the index page and the show page. 
- Implemented Permissions: Only the Administrator can change the status of the client through the HTML form on the browser; no one else has access to this ability.
- Added Invoice Data to Views
- Utilized "Include Secured" to ensure that only signed in users in the Web Appliction can access the clients and requests page, otherwise no redirect happens and the user stays on the current page.
- Implemented tests for "Include Secured" 
- Wrote new tests for the implemented front end design changes
- Experimented with Stripe for E-Commerce.
- Updated the Identity providers
- Created a page that shows the Team's information.

## Sprint Deliverables - 4/14
- Finished the download manager which allows the Administrator to Upload a PDF file containing the client's services 
- Implemented Permissions: Only administrators can change the status through the HTTP requests 
- Created a cart and e-commerce page 
- Updated the framework so that only clients can see themselves on the clients table
- Updated the framework so that the clients can only see the downloads table on the downloads page 
- Made the tables mobile friendly

## Sprint Deliverables - 5/5
