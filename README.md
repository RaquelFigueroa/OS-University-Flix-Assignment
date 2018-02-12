# Project 1 - *Flix*

**Flix** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **3** hours spent in total

## User Stories

The following **required** user stories are complete:

- [x] User sees app icon in home screen and styled launch screen (+1pt)
- [x] User can scroll through a list of movies currently playing in theaters from The Movie DB API (+5pt)
- [x] User can "Pull to refresh" the movie list (+2pt)
- [x] User sees a loading state while waiting for the movies to load (+2pt)

The following **stretch** user stories are implemented:

- [x] User sees an alert when there's a networking error (+1pt)
- [ ] User can search for a movie (+3pt)
- [ ] While poster is being fetched, user see's a placeholder image (+1pt)
- [ ] User sees image transition for images coming from network, not when it is loaded from cache (+1pt)
- [ ] Customize the selection effect of the cell (+1pt)
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete (+2pt)

The following **additional** user stories are implemented:

- [ ] List anything else that you can get done to improve the app functionality! (+1-3pts)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I would like to better uderstand how to use`!` and `?`.
2. Resizing elements in the layout was a little unclear to me. How to best modify layout to fit the device would be a great topic to quickly learn.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://raw.githubusercontent.com/RaquelFigueroa/OS-University-Flix-Assignment/master/images/Assignment1_Flix_Demo.gif' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I was first trying to open the project like normal after installing AlamofireImage. I kept getting an odd error and became frustrated. I soon realized I missed a step and it is necessary to open the file `*.xcworkspace` project.

## License

Copyright 2018 CSUMB

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


# Project 2 - *Flix*

**Flix** is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **5.5** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can tap a cell to see a detail view (+5pts)
- [x] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView (+5pts)

The following **stretch** features are implemented:

- [x] User can tap a poster in the collection view to see a detail screen of that movie (+3pts)
- [ ] In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer (+3pts)
- [x] Customize the navigation bar (+1pt)
- [ ] List in any optionals you didn't finish from last week (+1-3pts)
- ...
- ...

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. It would be helpful to learn more about customization in general. How to play more with background colors/images.
2. I would greatly like to discuss how others are implementing some of the optional tasks. What resources are they using?

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/RaquelFigueroa/OS-University-Flix-Assignment/blob/master/images/Assignment2_Flix_Demo.gif' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

One challege I encountered occured when I was implementing the ability to view the detail movie view for the controller view. I understood that I would be able to use the previously made detail view controller, but I believed it was solely accessible from `NowPlayingViewController.swift` file. I tried to create a way for the file to recognize whether the segue request was coming from the `MovieCell` or `PosterCell`. I soon realized that this was not the case and that the `SuperheroViewController.swift` file would have the code for the segue from the `MovieCell`. I did learn how to access a segue identifier, which I believe will be helpful for future iOS development projects.

## License

Copyright 2018 R. Figueroa

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

