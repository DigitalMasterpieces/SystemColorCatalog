import PlaygroundSupport
import UIKit

/// Playground for creating an asset catalog containing all (dynamic) system colors,
/// including those introduced in iOS 13, that can be used for backward compatibility with iOS 11 and 12.
/// It also generates a Swift file containing constants for all those colors that can also be used in iOS < 11.


// MARK: - Configuration

/// Name of the generated catalog and Swift file.
let generatedName = "SystemColors"

/// If `true`, the dark variants of the system colors are used as the fallback option.
let useDarkAsFallback = false


// MARK: - Helpers

extension UIColor {

    var components: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }

    var r: CGFloat {
        return self.components.r
    }
    var g: CGFloat {
        return self.components.g
    }
    var b: CGFloat {
        return self.components.b
    }
    var a: CGFloat {
        return self.components.a
    }

}

extension CGFloat {

    var shortString: String {
        return String(format: "%.3f", self)
    }

}


let fileManager = FileManager()
let sharedDir = playgroundSharedDataDirectory


// MARK: - Catalog Creation

let catalogURL = sharedDir.appendingPathComponent("\(generatedName).xcassets", isDirectory: true)
// delete old catalog if existing
try? fileManager.removeItem(at: catalogURL)
// create new catalog
try fileManager.createDirectory(at: catalogURL, withIntermediateDirectories: true, attributes: nil)
// add `Contents.json` file so Xcode recognizes it as asset catalog
let contentsJSON = """
{
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
"""
try contentsJSON.write(to: catalogURL.appendingPathComponent("Contents").appendingPathExtension("json"), atomically: false, encoding: .utf8)

// path to the Swift file
let swiftFileURL = sharedDir.appendingPathComponent("\(generatedName)").appendingPathExtension("swift")
// delete old file if existing
try? fileManager.removeItem(at: swiftFileURL)


// MARK: - System Colors

let systemColors: [(name: String, color: UIColor)] = [
    (name: "systemRed", color: .systemRed),
    (name: "systemGreen", color: .systemGreen),
    (name: "systemBlue", color: .systemBlue),
    (name: "systemOrange", color: .systemOrange),
    (name: "systemYellow", color: .systemYellow),
    (name: "systemPink", color: .systemPink),
    (name: "systemPurple", color: .systemPurple),
    (name: "systemTeal", color: .systemTeal),
    (name: "systemIndigo", color: .systemIndigo),
    (name: "systemGray", color: .systemGray),
    (name: "systemGray2", color: .systemGray2),
    (name: "systemGray3", color: .systemGray3),
    (name: "systemGray4", color: .systemGray4),
    (name: "systemGray5", color: .systemGray5),
    (name: "systemGray6", color: .systemGray6),
    (name: "label", color: .label),
    (name: "secondaryLabel", color: .secondaryLabel),
    (name: "tertiaryLabel", color: .tertiaryLabel),
    (name: "quaternaryLabel", color: .quaternaryLabel),
    (name: "link", color: .link),
    (name: "placeholderText", color: .placeholderText),
    (name: "separator", color: .separator),
    (name: "opaqueSeparator", color: .opaqueSeparator),
    (name: "systemBackground", color: .systemBackground),
    (name: "secondarySystemBackground", color: .secondarySystemBackground),
    (name: "tertiarySystemBackground", color: .tertiarySystemBackground),
    (name: "systemGroupedBackground", color: .systemGroupedBackground),
    (name: "secondarySystemGroupedBackground", color: .secondarySystemGroupedBackground),
    (name: "tertiarySystemGroupedBackground", color: .tertiarySystemGroupedBackground),
    (name: "systemFill", color: .systemFill),
    (name: "secondarySystemFill", color: .secondarySystemFill),
    (name: "tertiarySystemFill", color: .tertiarySystemFill),
    (name: "quaternarySystemFill", color: .quaternarySystemFill),
    (name: "lightText", color: .lightText),
    (name: "darkText", color: .darkText),
]


// MARK: - Traits

let lightTrait = UITraitCollection(userInterfaceStyle: .light)
let darkTrait = UITraitCollection(userInterfaceStyle: .dark)
let highContrastTrait = UITraitCollection(accessibilityContrast: .high)
let lightHighContrastTrait = UITraitCollection(traitsFrom: [lightTrait, highContrastTrait])
let darkHighContrastTrait = UITraitCollection(traitsFrom: [darkTrait, highContrastTrait])


// MARK: - Generation

// header content of the Swift file
var swiftFileContents = """
import UIKit

enum \(generatedName) {

    /// Helper for loading a named color from an asset catalog if possible, using the fallback otherwise.
    private static func color(named: String, fallback: UIColor) -> UIColor {
        if #available(iOS 11.0, *) {
            let namedColor = UIColor(named: named)
            assert(namedColor != nil, "Failed to load color from resource bundle")
            return namedColor ?? fallback
        } else {
            return fallback
        }
    }


"""

for (name, color) in systemColors {
    // create the different color variants based on the different traits
    let anyColor = useDarkAsFallback ? color.resolvedColor(with: darkTrait) : color
    let lightColor = color.resolvedColor(with: lightTrait)
    let darkColor = color.resolvedColor(with: darkTrait)
    let anyHighContrastColor = anyColor.resolvedColor(with: highContrastTrait)
    let lightHighContrastColor = color.resolvedColor(with: lightHighContrastTrait)
    let darkHighContrastColor = color.resolvedColor(with: darkHighContrastTrait)

    // append an entry to the Swift file's enum
    swiftFileContents.append(
        """
            static var \(name): UIColor {
                return color(named: "\(name)", fallback: #colorLiteral(red: \(anyColor.r), green: \(anyColor.g), blue: \(anyColor.b), alpha: \(anyColor.a)))
            }

        """
    )

    // write colors into color set JSON format for the asset catalog
    let colorJSON = """
    {
      "info" : {
        "version" : 1,
        "author" : "xcode"
      },
      "colors" : [
        {
          "idiom" : "universal",
          "color" : {
            "color-space" : "srgb",
            "components" : {
              "red" : "\(anyColor.r.shortString)",
              "alpha" : "\(anyColor.a.shortString)",
              "blue" : "\(anyColor.b.shortString)",
              "green" : "\(anyColor.g.shortString)",
            }
          }
        },
        {
          "idiom" : "universal",
          "appearances" : [
            {
              "appearance" : "luminosity",
              "value" : "light"
            }
          ],
          "color" : {
            "color-space" : "srgb",
            "components" : {
              "red" : "\(lightColor.r.shortString)",
              "alpha" : "\(lightColor.a.shortString)",
              "blue" : "\(lightColor.b.shortString)",
              "green" : "\(lightColor.g.shortString)",
            }
          }
        },
        {
          "idiom" : "universal",
          "appearances" : [
            {
              "appearance" : "luminosity",
              "value" : "dark"
            }
          ],
          "color" : {
            "color-space" : "srgb",
            "components" : {
              "red" : "\(darkColor.r.shortString)",
              "alpha" : "\(darkColor.a.shortString)",
              "blue" : "\(darkColor.b.shortString)",
              "green" : "\(darkColor.g.shortString)",
            }
          }
        },
        {
          "idiom" : "universal",
          "appearances" : [
            {
              "appearance" : "contrast",
              "value" : "high"
            }
          ],
          "color" : {
            "color-space" : "srgb",
            "components" : {
              "red" : "\(anyHighContrastColor.r.shortString)",
              "alpha" : "\(anyHighContrastColor.a.shortString)",
              "blue" : "\(anyHighContrastColor.b.shortString)",
              "green" : "\(anyHighContrastColor.g.shortString)",
            }
          }
        },
        {
          "idiom" : "universal",
          "appearances" : [
            {
              "appearance" : "luminosity",
              "value" : "light"
            },
            {
              "appearance" : "contrast",
              "value" : "high"
            }
          ],
          "color" : {
            "color-space" : "srgb",
            "components" : {
              "red" : "\(lightHighContrastColor.r.shortString)",
              "alpha" : "\(lightHighContrastColor.a.shortString)",
              "blue" : "\(lightHighContrastColor.b.shortString)",
              "green" : "\(lightHighContrastColor.g.shortString)",
            }
          }
        },
        {
          "idiom" : "universal",
          "appearances" : [
            {
              "appearance" : "luminosity",
              "value" : "dark"
            },
            {
              "appearance" : "contrast",
              "value" : "high"
            }
          ],
          "color" : {
            "color-space" : "srgb",
            "components" : {
              "red" : "\(darkHighContrastColor.r.shortString)",
              "alpha" : "\(darkHighContrastColor.a.shortString)",
              "blue" : "\(darkHighContrastColor.b.shortString)",
              "green" : "\(darkHighContrastColor.g.shortString)",
            }
          }
        }
      ]
    }
    """

    // create a `colorset` directory for the system color and write `Contents.json` there
    let colorDirURL = catalogURL.appendingPathComponent("\(name).colorset", isDirectory: true)
    try fileManager.createDirectory(at: colorDirURL, withIntermediateDirectories: true, attributes: nil)
    try colorJSON.write(to: colorDirURL.appendingPathComponent("Contents").appendingPathExtension("json"), atomically: false, encoding: .utf8)
}

// add closing braces to Swift enum
swiftFileContents.append(
    """

    }

    """
)
// write Swift file
try swiftFileContents.write(to: swiftFileURL, atomically: false, encoding: .utf8)


print("Done. The asset catalog can be found here:")
print(catalogURL.path)
print("The generated Swift file is here:")
print(swiftFileURL.path)
