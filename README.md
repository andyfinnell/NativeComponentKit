# NativeComponentKit
![Tests](https://github.com/andyfinnell/NativeComponentKit/workflows/Tests/badge.svg) [![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

NativeComponentKit is a testbed for experimenting with internal plugin systems. Its goal is to solve large-team problems, where the app needs to be divided into vertical feature slices using hard boundaries. The framework defines infrastructure that allows one vertical slice to share components with another vertical slice without explicitly coupling them.

NativeComponentKit supports iOS, macOS, and tvOS.

## Requirements

- Swift 5.2 or greater
- iOS/tvOS 13 or greater OR macOS 10.15 or greater

## Installation

Currently, NativeComponentKit is only available as a Swift Package.

### ...using a Package.swift file

Open the Package.swift file and edit it:

1. Add NativeComponentKit repo to the `dependencies` array.
1. Add NativeComponentKit as a dependency of the target that will use it

```Swift
// swift-tools-version:5.2

import PackageDescription

let package = Package(
  // ...snip...
  dependencies: [
    .package(url: "https://github.com/andyfinnell/NativeComponentKit.git", from: "0.0.1")
  ],
  targets: [
    .target(name: "MyTarget", dependencies: ["NativeComponentKit"])
  ]
)
```

Then build to pull down the dependencies:

```Bash
$ swift build
```

### ...using Xcode

Use the Swift Packages tab on the project to add NativeComponentKit:

1. Open the Xcode workspace or project that you want to add NativeComponentKit to
1. In the file browser, select the project to show the list of projects/targets on the right
1. In the list of projects/targets on the right, select the project
1. Select the "Swift Packages" tab
1. Click on the "+" button to add a package
1. In the "Choose Package Repository" sheet, search for  "https://github.com/andyfinnell/NativeComponentKit.git"
1. Click "Next"
1. Choose the version rule you want
1. Click "Next"
1. Choose the target you want to add NativeComponentKit to
1. Click "Finish"

## Usage 

TBD
