<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://rocketlift.ca/assets/_rocket/R2-3c6296bf2343b849b947f8ccfce0de61dd34ba7f9e2a23a53d0a743bc4604e3c.png">
    <img src="https://rocketlift.ca/assets/_rocket/R2-3c6296bf2343b849b947f8ccfce0de61dd34ba7f9e2a23a53d0a743bc4604e3c.png" alt="Logo" width="500" height="200">
  </a>

  <h3 align="center">Rocket Elevators Information System
</h3>
  
  <p align="center">
    Odyssey Program - Weeks 10
  </p>
</p>



<!-- ABOUT THE PROJECT -->
## About The Project

Rocket Elevators Information System is the 4th and 5th project for the Odyssey 14 weeks program in CodeBoxx. 

By the 4th week We have created a CRUD website using a using Ruby on Rails with the website created in the Genesis Program. 

website used: [rocketlift.ca/](https://rocketlift.ca/)

We have also included a MySql Database that saves the quotations inserted in the quote form, and an Admin page.

For the week 10, we have to implement some test with RSpec.

If you want to execute the test, i have two file.

```bundle exec rspec ./spec/streamer_spec.rb```
```bundle exec rspec ./spec/pages_controller_spec.rb```

For the HTTPS Website: https://youtu.be/FfcGjYskpHI

##

For the 5th week, we have included a Data Warehouse with Postgres where has taken the subimitted quotes and contact forms info and through some queries
the Admin was able to analyse those data.

<br>

We have 7 API on the project

- **[Maps JavaScript API]**
- **[Twillo]**
- **[Zendesk]**
- **[Sengrid]**
- **[IBM Watson]**
- **[Dropbox]**
- **[Slack]**
- **[REST API]**  FOR ENDPOINTS GO ON THE [Consolidation_REST_API](https://github.com/AlexWallot/Consolidation_Rest_API)

If you want to test Dropbox, you have to create a customer (from backoffice) and a lead (from the index page) with the same phone number and email and go on the Admin_Stats page to trigger Dropbox.

If you want to test google maps, wait for it to finish loading, even if the browser isn't loading anymore.

If you want to test watson, press on the button to load him.

## Website deployed

* ### [rocketlift.ca/](https://rocketlift.ca/)

<br>

## Installation

Clone or download the .zip for this project. 

Here are the commands that will have to be entered in your terminal to start the server:
- mySQL server start
- ruby -v (To check if a corresponding version need to be installed)
- rails -v (To check if a corresponding version need to be installed)
- bundle install (To install all the necessary Gems)
- Check in the directory for config/database.yml and if necessary replace the database password by yours.
- rails db:create
- rails s

<br>

Here are the commands that will have to be entered in your terminal when modifications are made in the database:
- Ctrl + C (to stop the server)
- rails db:migrate reset
- rails db:seed

<br>

## Accessing

By clicking on “Login”, users will be redirected to a page and be asked to provide an email address and password.
	
	Example: 

	Email: nicolas.genest@codeboxx.biz
	Password: password

Forms are accessible to all users (with or without accounts). Once a “Contact Us” part for home page or Quote form in request a quote page is filled and submitted, data is generated in the back-end.

<br>

To access the database, use Dbeaver or MySQLWorkbench, which shows a history of data stored in the server. The fictitious and real data covers the last 3 years of activity from companies. Graphical representations and charts will also be available in the stats page of the website. 

<br>

## Machine Learning
In week 13, we had to implement a Speech to text instance using Azure Cognitive Services to our application. The report attached to the delivrable will describe all the technical steps that were needed to achive that goal.  Once in the back office of the website, click on the AI tab and you can now test the instance by selecting a conversation .wav file located in app/ML_CONVERSATIONS_MONO_16.  A POST request will then be performed and once the POST is completed, a GET request will be enabled and display the profile ID of the recongnized user.  The code for the requests can be found at this path controllers/identification_controller.rb as well as the views views/pages/machine_learning.erb

## Built With

* [Ruby V-2.6.6](https://www.ruby-lang.org/en/)
* [Rails V-5.2.6](https://guides.rubyonrails.org/)
* [MySql V-5.7](https://dev.mysql.com/)
* [Bootstrap](https://getbootstrap.com)
* [JQuery](https://jquery.com)
* [Postgres V-10.18](https://www.postgresql.org/docs/10/release-10-18.html)


<br>

<!-- TEAM MWMBERS -->
## TEAM Project~> Members:

- **[Ted Lemy](https://github.com/lemyted)**
- **[Alex Wallot](https://github.com/AlexWallot)**
- **[Luka Trudel](https://github.com/LukaTrudel)**
- **[Armughan Ayaz Janjua](https://github.com/armughanayaz)**



<br>

##
Project Link: [https://github.com/AlexWallot/Rocket_Elevators_API](https://github.com/lemyted/Rocket_Elevators_API)
