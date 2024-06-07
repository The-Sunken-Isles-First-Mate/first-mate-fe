# First Mate FE

### [First Mate BE GH Repo](https://github.com/The-Sunken-Isles-First-Mate/first-mate-be)

### There is currently no live deployment of this application.

### About

This is the frontend repo for the Sunken Isles First Mates web application. Our minimal viable product (MVP) includes functionality for a user to log in to the web application through GitHub OAuth and create a campaign, create a character, and manipulate data related to the campaign that changes from week to week.

There are three main pages for a campaign - the Summary page, the Resource Management page, and the Party page.

* The Summary page lists all the available resources for a campaign. These are all resources that have been gathered by villagers assigned by the party members of the campaign.

* The Resource Management page lists all the available resources for a campaign, as well as contains a form where party members can assign villagers to perform certain tasks, as well as craft certain items. Note: In order to craft the item, the resources needed to craft the item MUST be in the available resources section. The Resource Management page also has an Advance Week button, which the Dungeon Master of the campaign can click and send into motion the resource gathering and item crafting, as well as advance the week.

* The Party page lists all current party member's characters for the campaign. This includes their name, race, and class

This application is only one half of the Sunken Isles First Mates web application, and is primarily responsible for handling everything user facing (presenting the user the option to login through GH Oauth, displaying the appropriate information for a user, and displaying all the important information for creating a campaign, creating a character, and entering data into a form.

### End Users

Simply put, the end user for this application is someone that loves to play the game Dungeons and Dragons, and wants an easy-to-use tool that would allow them to keep track of all the resouces they currently have in their DnD campaign. We primarily exhibited user empathy by creating a simple, web application that is mobile-friendly and responsive to different screen sizes. There are a limited number of pages, and each page has a semi-transparent background to make reading easier.

### Local Setup

```
Fork and clone this repository
Fork and clone the BE repository linked above

[For both repositories]

cd into each
bundle install
rails db:{drop,create,migrate,seed}
```

### Local App Navigation

1. Sign in through the GitHub OAuth

This will take you to the user dashboard.

2. Click 'Create Campaign'

This will bring you to a form where you will be able to enter a campaign name, and invite any additional players to your campaign (they must have created an account prior).

3. Click the 'Create Campaign' Button

This will navigate you to the campaign summary page, where you will see the name of the campaign, the current week (should start at 0), as well as a list of owned items.

4. Select 'Management' from the Nav Bar

This will send you to the Resource Management page which will list all the available resources as well as the management form. This management form has two different sections - one for assigning villagers to perform tasks, as well as crafting any items. It must be noted that to create any item, the resources for the item must have already been gathered by the villagers. To see what resources are needed to create an item, check out the official documentation for [Sunken Isles](https://drive.google.com/file/d/16AB3a39-pvw9Els6liYBOH9zxSK6JIkq/view).

5. Select 'Party' from the Nav Bar

This will take you to the Party page which will list all the current party member's characters currently in the party, as well as their name, class, race, and profile picture.

### Versions

- Ruby 3.2.2
- Rails 7.1.2

### Implementation of OAuth

For this project, we decided to implement GitHub OAuth as the primary way of signing into our web application. We initially tried to implement Google's OAuth, but found some challenges with it that we weren't able to figure out. All of us have prior experience with implementing GitHub OAuth so it was nice to have that as a backup plan while we tried using a new OAuth provider. However, it was not without its challenges. Due to this web application having both a frontend and backend, and the backend is where the users' information is stored, there were some issues with sending the data to the backend, creating the user model, and assigning the current user of the application to the new model that was created. We did succeed in getting it to work by creating a PORO and manually assigning the attributes to they values of the nested hash from the backend API call to see if the user already existed.

### Screenshots

<details>
  <summary> See Screenshots </summary>
  
![image (7)](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/142369918/f652e424-f42d-4279-b954-2de617303a4c)
![image (6)](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/142369918/9ac1a2a1-2968-4901-ba57-d6533d0e7393)
![image (8)](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/142369918/44d495e1-6dde-46ff-90a5-bc6a6d99d230)
![image (2)](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/142369918/78983368-51fb-4e8f-84e7-a8ab2d6a7b6b)
![image (4)](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/142369918/6a5e941f-5067-463d-a917-ba6811fe5179)
![image (5)](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/142369918/a31b8477-3770-4948-ae04-ff22f9313ce4)
![image (3)](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/142369918/2a08831c-6477-461c-8c50-341784fddcf9)
![image (1)](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/142369918/f3795f66-bd30-403b-be0a-6a0500f75356)

</details>

### Goals

Feature Delivery
- [x] 90% or more MVP stories are completed
- [x] at least 1 external API is consumed
- [x] OAuth works error-free in incognito/private
- [x] Students can explain in-depth what features use their chosen technologies, either FE or BE
- [x] Project meets point threshold (5)

Technical Quality
- [x] Code follows DRY and SRP design
- [x] Routes follow RESTful patterns (Frontend, User-facing routes are friendly)
- [x] Controllers utilize Facades
- [x] Facades utilize Service calls to store/retrieve data
- [x] Deploy to the internet (using Render, Heroku, etc)
- [x] No data storage (models, database schema, etc) is done at this layer; user info, sessions and caching are the exception
- [x] Application is easy to navigate for non-technical users

Testing
- [x] FE Repo - 90% or more test coverage, includes happy path and sad path expectations
- [x] API calls to external services are tested using mocks/stubs in at least one application (using tools like Webmock, VCR, etc.)

### Tests

To run the test suite, in the root folder of the application:

```
bundle exec rspec spec
```

* 51 Total Tests (Over 90% test coverage)

### Resources

* [DTR](https://docs.google.com/document/d/14kgT_dFLwxf5YbhW60A4qFVJ9nUUK9TJIrYoOJ1D1JE/edit)
* [Miro Board](https://miro.com/app/board/uXjVKCJ_O7U=/)
* [DnD API](https://www.dnd5eapi.co/)

### Contributors

* Billy Wallace | [GitHub](https://github.com/wallacebilly1), [LinkedIn](https://www.linkedin.com/in/wallacebilly1)
* Jared Hobson | [GitHub](https://www.linkedin.com/in/jaredhobson), [LinkedIn](https://www.linkedin.com/in/jaredhobson/)
* Grant Davis | [Grant's GitHub](https://github.com/grantdavis303), [LinkedIn](https://www.linkedin.com/in/grantdavis303)
* Lance Butler | [Lance's GitHub](https://github.com/LJ9332), [LinkedIn](https://www.linkedin.com/in/lance-butler-jr)
* Logan Finnegan | [GitHub](https://github.com/LoganFinnegan), [LinkedIn](https://www.linkedin.com/in/logan-finnegan)
