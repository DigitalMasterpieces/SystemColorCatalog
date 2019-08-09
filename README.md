# SystemColors.xcassets
An Xcode asset catalog containing all dynamic system colors for backwards compatibility with iOS 11 and 12.

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

## Generation
The asset catalog was generated from the actual system colors using the `SystemColorsCatalogGeneration.playground`.
