# ACYKit

[![Build Status](https://www.bitrise.io/app/429993d68cdbb9b8/status.svg?token=XxLWJwSvyQTkJVs53Jbabw)](https://www.bitrise.io/app/429993d68cdbb9b8)
[![codecov](https://codecov.io/gh/archmagees/ACYKit/branch/master/graph/badge.svg)](https://codecov.io/gh/archmagees/ACYKit)
[![Version](https://img.shields.io/cocoapods/v/ACYKit.svg?style=flat)](http://cocoapods.org/pods/ACYKit)
[![License](https://img.shields.io/cocoapods/l/ACYKit.svg?style=flat)](http://cocoapods.org/pods/ACYKit)
[![Platform](https://img.shields.io/cocoapods/p/ACYKit.svg?style=flat)](http://cocoapods.org/pods/ACYKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

platform: iOS 8.0

To use the pods, you need to install the [CocoaPods](http://cocoapods.org), the best way to install it is using [bundler](http://bundler.io). So run command in your command line:

```shell
$ cd YOUR_PROJECT_ROOT_DIR
$ gem install bundler
$ vim Gemfile
```
And add the following lines to Gemfile:
```ruby
source "https://gems.ruby-china.org/"
gem "cocoapods"
```
*  If you are NOT in China, the first line is NOT needed!

Save it, and run command:

```shell
$ bundle install
```
Now you can use [CocoaPods](http://cocoapods.org).

## Installation

ACYKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ACYKit"
```

If you just want to use some sub pods, you can add lines like this:

```ruby
pod 'ACYKit', :subspecs => ['LogManager', 'Foundation'], :git => 'git@github.com:archmagees/ACYKit.git
```

## Author

Arthur Liu, archmagees+cocoapods@gmail.com

## License

ACYKit is available under the MIT license. See the LICENSE file for more info.
