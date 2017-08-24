# Pre-work - *tipCalc3*

**tipCalc3** is a tip calculator application for iOS.

Submitted by: **Joey Q Nguyen**

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators. See function name formatCurrency
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:
- [X] Use UIstepper in settings to let user increase the number of people in group and save value in user default 
- [X] Instead of using IOS keyboard, I create my own number pad using buttons. The number buttons will append the number to the string. The clear button ('C') will clear all the number and set the value to 0. The decimal button will add a decimal to the string. A fuction is added to prevent user from entering multiple decimal point. 
- [X] I design my own app icon using a tool call inkscape and upload to my apps. Press command+shift+h to see the icon.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/AECsoY1.gif' title='Video Walkthrough' width='100' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** [Enter your answer here in a paragraph or two].
The IOS app development platform is fairly easy to use. In the storyboard, I can drag and drop items such as label, text field and button that will display on the app user interface (UI). It was fun to learn that most apps are designed with just these simple objects. In order to create an interaction between these objects and my source codes, I need to create connections called outlets and actions.

Outlets let me reference a user interface (UI) object on my storyboard to my source codes. For example, my bill_label display $0 as default. If I want to programmatically change bill_label to say $50, I first need to create an outlet connection between my UI label to my source code. Once the connection has been established, I can call the outlet and assign it a new value. 

Actions is a group of codes/app logics that trigger or respond to a user event. For example, my function tipCalc is triggered whenever the user enter a new value into the textfield. This event then excecute the app logic and manipulate the data to calculate the tip amount and change the value of the tip amount label.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** [Enter your answer here in a paragraph or two].
I can create a strong reference cycle using just 1 class. I first create a class as I normally do. Then I add a closure property to my class. When I assign a closure to a property of my class, it is just a reference to that closure. So I actually have 2 references and I can treat the closure reference as a separate class. In this scenario, my class instance hold a strong reference to the closure because it is a property of my class. And the closure in its body refers to 'self' to access a property or to call a method of my class, a strong reference is then created back to my class instance. So in the end, these two strong references are keeping each other alive.


## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
