# First Mate FE

### [First Mate BE GH Repo](https://github.com/The-Sunken-Isles-First-Mate/first-mate-be)

### [First Mate FE Live Deployment]()

### About

FE for the First Mates app

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

2. Click Create Campaign

This will bring you to a form where you will be able to enter a campaign name, and invite any additional players to your campaign (they must have created an account prior).

3. Click the Create Campaign Button

This will navigate you to the campaign summary page, where you will see the name of the campaign, the current week (should start at 0), as well as a list of owned items.

4. Select 'Management' from the Nav Bar

This will send you to the Resource Management page which will list all the available resources as well as the management form. This management form has two different sections - one for assigning villagers to perform tasks, as well as crafting any items. It must be noted that to create any item, the resources for the item must have already been gathered by the villagers. To see what resources are needed to create an item, check out the official documentation for [Sunken Isles](https://drive.google.com/file/d/16AB3a39-pvw9Els6liYBOH9zxSK6JIkq/view).

5. Select 'Party' from the Nav Bar

This will take you to the Party page which will list all the current party member's characters currently in the party, as well as their name, class, race, and profile picture.

### Versions

- Ruby 3.2.2
- Rails 7.1.2

### Implementation of OAuth

### Screenshots

### Progress

x / 17 User Stories Completed

### Goals

Feature Delivery
- [ ] 90% or more MVP stories are completed
- [x] at least 1 external API is consumed
- [ ] OAuth works error-free in incognito/private
- [ ] Students can explain in-depth what features use their chosen technologies, either FE or BE
- [ ] Project meets point threshold (5)

Technical Quality
- [ ] Code follows DRY and SRP design
- [ ] Routes follow RESTful patterns (Frontend, User-facing routes are friendly)
- [x] Controllers utilize Facades
- [x] Facades utilize Service calls to store/retrieve data
- [ ] Deploy to the internet (using Render, Heroku, etc)
- [x] No data storage (models, database schema, etc) is done at this layer; user info, sessions and caching are the exception
- [ ] Application is easy to navigate for non-technical users

Testing
- [ ] FE Repo - 90% or more test coverage, includes happy path and sad path expectations
- [ ] API calls to external services are tested using mocks/stubs in at least one application (using tools like Webmock, VCR, etc.)

README
- [ ] Outlines MVP of the Project
- [ ] Discusses end users, persona analysis
- [ ] Discusses technical design choices made
- [x] Contains a link to the other project repo and production link
- [x] Contains a list of contributors, their GH profiles, and LinkedIn profiles
- [ ] Discusses the purpose of it's purpose (how it fits into SOA - FE being FE)
- [ ] Discusses how to install and test the repo
- [ ] Has screenshots
- [ ] Discusses OAuth
- [ ] Explains user personas and exhibits user empathy 

### Tests

* X Total Tests (100% coverage on x/x LOC)
* X Feature Tests (100% coverage on x/x LOC)
* X Model Tests (100% coverage on x/x LOC)

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