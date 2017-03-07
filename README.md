# SBNag.swift

[![CI Status](http://img.shields.io/travis/schrockblock/SBNag.swift.svg?style=flat)](https://travis-ci.org/schrockblock/SBNag.swift)
[![Version](https://img.shields.io/cocoapods/v/SBNag.swift.svg?style=flat)](http://cocoapods.org/pods/SBNag.swift)
[![License](https://img.shields.io/cocoapods/l/SBNag.swift.svg?style=flat)](http://cocoapods.org/pods/SBNag.swift)
[![Platform](https://img.shields.io/cocoapods/p/SBNag.swift.svg?style=flat)](http://cocoapods.org/pods/SBNag.swift)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

SBNag.swift is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod "SBNag.swift"`

## Usage

This is a simple pod to manage the logic behind nagging users to take actions like rating your app or upgrading to a paid version. To do so, simply create a new `SBNagtion` (think 'Nag Action'), and edit the defaults (`Example/SBNag/ViewController.swift` shows how you could do this). 

You'll most likely want to take some sort of action if the user agrees, and you can do this by providing a `yesAction`. 

The `defaultsKey` is for determining if the user has either agreed to take the action or permanently rejected your request, and so should be unique to the `SBNagtion`. For instance, you probably don't want to nag a user to rate your app after they already have, nor do you want to do so if they have decided never to rate it. The `defaultsKey` allows us to take care of that for you. 

## License

SBNag.swift is available under the MIT license. See the LICENSE file for more info.
