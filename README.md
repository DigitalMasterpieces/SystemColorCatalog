# SystemColors
This repository provides to things:
- An Xcode asset catalog containing all dynamic system colors for backwards compatibility with iOS 11 and 12.
- A Swift file for convenience access of those colors that also provides fallbacks for iOS < 11. 

## Usage
Download and drop the asset catalog in your project. Instead of the iOS-13-only API

```swift
label.textColor = UIColor.label
```

you can now use the color by name, which is also available in iOS 11 and 12:

```swift
label.textColor = UIColor(named: "label")
```

The colors will adapt for dark mode and the high contrast accessibility setting like the system colors would.

If you also add `SystemColors.swift` to your project, you can do the following instead:

```swift
label.textColor = SystemColors.label
```

## Generation
The asset catalog and Swift file were generated from the actual system colors using the `SystemColorsCatalogGeneration.playground`.
If you want to have the dark variants as default option in iOS < 13, you can change the `useDarkAsFallback` flag before running the playground. 
