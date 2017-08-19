# Pre-work - *TippyMcTipTip*

**TippyMcTipTip** is a tip calculator application for iOS.

Submitted by: **Haley Chen**

Time spent: **3** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

![Alt text](http://full/path/to/img.jpg "Optional title")

<img src='http://i.imgur.com/CIS5pGf.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:**
It's refreshing and fun to be able to develop code partially with GUI and drag-and-drop. It's also interesting to see how powerful the tooling for iOS development is -- XCode provides you with standardized components, simulators for several devices, autocompletion with Foundation Framework's methods, and probably a whole lot more. It's nice to see so much compile and pre-compile time warnings, having come from untyped languages Python and Javascript (non-Typescript). What I'm curious to see is, given such a thought-out ecosystem, how hard will it be to do things that deviate from Apple's recommended practices?

Outlets are a code reference to components that are generally created via XCode's GUI, storyboard interface. Actions are event handlers for events that act on the UI components. Both are implemented in XML.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:**
Swift uses ARC, which means that memory gets allocated whenever an instance is created, and memory gets deallocated when all strong references to the instance are set to nil. A strong reference cycle refers to a state where instances have strong references to each other, thus preventing any of the objects from ever being deallocated and thus creating a memory leak. For example, instance A has a strong reference to instance B, and instance B has a strong reference to instance A. If you set A to nil, it'll still have a strong reference coming from B, and same vice versa.

A strong reference cycle from a closure is one way a strong reference cycle can accidentally occur. A closure is a function that has access to variables in the scope that it was declared in, even when the closure is called when it is no longer in that scope. A strong reference cycle can happen if the closure has strong references to variables, and those variables have strong references to the closure. We can't access the body of the closure and set variable references to nil, so we'll always have a reference cycle. We can use weak and unowned references to avoid all strong reference cycles.


## License

    Copyright 2017 Haley Chen

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
