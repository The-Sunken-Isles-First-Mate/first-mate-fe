# First Mate FE
[Deployed Site](https://first-mate-fe-0787570249fd.herokuapp.com/)

### About

This is the frontend repo for the Sunken Isles First Mates web application. Our minimal viable product (MVP) includes functionality for a user to log in to the web application through GitHub OAuth and create a campaign, create a character, and manipulate data related to the campaign that changes from week to week.

There are three main pages for a campaign - the Summary page, the Resource Management page, and the Party page.

* The Summary page lists all the available resources for a campaign. These are all resources that have been gathered by villagers assigned by the party members of the campaign.

* The Resource Management page lists all the available resources for a campaign, as well as contains a form where party members can assign villagers to perform certain tasks, as well as craft certain items. Note: In order to craft the item, the resources needed to craft the item MUST be in the available resources section. The Resource Management page also has an Advance Week button, which the Dungeon Master of the campaign can click and send into motion the resource gathering and item crafting, as well as advance the week.

* The Party page lists all current party member's characters for the campaign. This includes their name, race, and class

This application is only one half of the Sunken Isles First Mates web application, and is primarily responsible for handling everything user facing (presenting the user the option to login through GH Oauth, displaying the appropriate information for a user, and displaying all the important information for creating a campaign, creating a character, and entering data into a form.

## End Users

Simply put, the end user for this application is someone that loves to play the game Dungeons and Dragons, and wants an easy-to-use tool that would allow them to keep track of all the resouces they currently have in their DnD campaign. We primarily exhibited user empathy by creating a simple, web application that is mobile-friendly and responsive to different screen sizes. There are a limited number of pages, and each page has a semi-transparent background to make reading easier.

## Local Setup

```
Fork and clone this repository
Fork and clone the BE repository linked above

[For both repositories]

cd into each
bundle install
rails db:{drop,create,migrate,seed}
```

## Local App Navigation

1. Sign in through the Google OAuth

This will take you to the user dashboard.

2. Click 'Create Campaign'

This will bring you to a form where you will be able to enter a campaign name, and invite any additional players to your campaign with their email (they must have created an account prior).

3. Click the 'Create Campaign' Button

This will navigate you to the campaign summary page, where you will see the name of the campaign, the current week (should start at 0), as well as a list of owned items.

4. Select 'Management' from the Nav Bar

This will send you to the Resource Management page which will list all the available resources as well as the management form. This management form has two different sections - one for assigning villagers to perform tasks, as well as crafting any items. It must be noted that to create any item, the resources for the item must have already been gathered by the villagers. To see what resources are needed to create an item, check out the official documentation for [Sunken Isles](https://drive.google.com/file/d/16AB3a39-pvw9Els6liYBOH9zxSK6JIkq/view).

5. Select 'Party' from the Nav Bar

This will take you to the Party page which will list all the current party member's characters currently in the party, as well as their name, class, race, and profile picture.

### Versions

- Ruby 3.2.2
- Rails 7.1.2

### Screenshots

<details>
  <summary> See Screenshots </summary>

![Image 1](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/155924313/6a8e92ce-f5f8-4f6f-b043-95cad29c9998)
![Image 2](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/155924313/94880661-bc2c-45df-9cc3-557804e59e38)
![Image 3](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/155924313/115c1daa-cebf-42ce-9996-9e278d2c5d49)
![Image 4](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/155924313/68a790a4-1767-48ec-b7b3-fc059f37dd3f)
![Image 5](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/155924313/7f58e2b9-4b15-45eb-9bea-31e92169c716)
![Image 6](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/155924313/782ad0d7-21ab-49af-847b-b87024bd430a)
![Image 7](https://github.com/The-Sunken-Isles-First-Mate/first-mate-fe/assets/155924313/a8ddc490-4834-48cf-909f-94636f2e298f)

</details>

### Tests

To run the test suite, in the root folder of the application:

```
bundle exec rspec spec
```

### Resources
* [Miro Planning Board](https://miro.com/app/board/uXjVKCJ_O7U=/)

### Contributors

* Billy Wallace | [GitHub](https://github.com/wallacebilly1), [LinkedIn](https://www.linkedin.com/in/wallacebilly1)
* Jared Hobson | [GitHub](https://www.linkedin.com/in/jaredhobson), [LinkedIn](https://www.linkedin.com/in/jaredhobson/)
* Grant Davis | [Grant's GitHub](https://github.com/grantdavis303), [LinkedIn](https://www.linkedin.com/in/grantdavis303)
* Lance Butler | [Lance's GitHub](https://github.com/LJ9332), [LinkedIn](https://www.linkedin.com/in/lance-butler-jr)
* Logan Finnegan | [GitHub](https://github.com/LoganFinnegan), [LinkedIn](https://www.linkedin.com/in/logan-finnegan)
