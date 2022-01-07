<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://rocketlift.ca/assets/_rocket/R2-3c6296bf2343b849b947f8ccfce0de61dd34ba7f9e2a23a53d0a743bc4604e3c.png">
    <img src="https://rocketlift.ca/assets/_rocket/R2-3c6296bf2343b849b947f8ccfce0de61dd34ba7f9e2a23a53d0a743bc4604e3c.png" alt="Logo" width="500" height="200">
  </a>

  <h3 align="center">Rocket Elevators Information System
</h3>
  
  <p align="center">
    Odyssey Program - Weeks 13
  </p>
</p>


## Machine Learning

In week 13, we had to implement a Speech to text instance using Azure Cognitive Services to our application.
The report(https://docs.google.com/document/d/1X0FY4_BD4Iab_SkY6G7AUQZz1FXqtr7-nJzJUExisKw/edit) describes all the technical steps that were needed to achive that goal.  Once in the back office of the website, click on the AI tab and you can now test the instance by selecting a conversation .wav file located in app/ML_CONVERSATIONS_MONO_16.  A POST request will then be performed and once the POST is completed, a GET request will be enabled and display the profile ID of the recongnized user.  The code for the requests can be found at this path controllers/identification_controller.rb as well as the views views/pages/machine_learning.erb





