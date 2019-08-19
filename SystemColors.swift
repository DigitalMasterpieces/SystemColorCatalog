import UIKit

enum SystemColors {

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

    static var systemRed: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemRed
        } else {
            return color(named: "systemRed", fallback: #colorLiteral(red: 1.0, green: 0.23137254901960785, blue: 0.18823529411764706, alpha: 1.0))
        }
    }
    static var systemGreen: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemGreen
        } else {
            return color(named: "systemGreen", fallback: #colorLiteral(red: 0.20392156862745098, green: 0.7803921568627451, blue: 0.34901960784313724, alpha: 1.0))
        }
    }
    static var systemBlue: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemBlue
        } else {
            return color(named: "systemBlue", fallback: #colorLiteral(red: 0.0, green: 0.47843137254901963, blue: 1.0, alpha: 1.0))
        }
    }
    static var systemOrange: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemOrange
        } else {
            return color(named: "systemOrange", fallback: #colorLiteral(red: 1.0, green: 0.5843137254901961, blue: 0.0, alpha: 1.0))
        }
    }
    static var systemYellow: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemYellow
        } else {
            return color(named: "systemYellow", fallback: #colorLiteral(red: 1.0, green: 0.8, blue: 0.0, alpha: 1.0))
        }
    }
    static var systemPink: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemPink
        } else {
            return color(named: "systemPink", fallback: #colorLiteral(red: 1.0, green: 0.17647058823529413, blue: 0.3333333333333333, alpha: 1.0))
        }
    }
    static var systemPurple: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemPurple
        } else {
            return color(named: "systemPurple", fallback: #colorLiteral(red: 0.6862745098039216, green: 0.3215686274509804, blue: 0.8705882352941177, alpha: 1.0))
        }
    }
    static var systemTeal: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemTeal
        } else {
            return color(named: "systemTeal", fallback: #colorLiteral(red: 0.35294117647058826, green: 0.7843137254901961, blue: 0.9803921568627451, alpha: 1.0))
        }
    }
    static var systemIndigo: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemIndigo
        } else {
            return color(named: "systemIndigo", fallback: #colorLiteral(red: 0.34509803921568627, green: 0.33725490196078434, blue: 0.8392156862745098, alpha: 1.0))
        }
    }
    static var systemGray: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemGray
        } else {
            return color(named: "systemGray", fallback: #colorLiteral(red: 0.5568627450980392, green: 0.5568627450980392, blue: 0.5764705882352941, alpha: 1.0))
        }
    }
    static var systemGray2: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemGray2
        } else {
            return color(named: "systemGray2", fallback: #colorLiteral(red: 0.6823529411764706, green: 0.6823529411764706, blue: 0.6980392156862745, alpha: 1.0))
        }
    }
    static var systemGray3: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemGray3
        } else {
            return color(named: "systemGray3", fallback: #colorLiteral(red: 0.7803921568627451, green: 0.7803921568627451, blue: 0.8, alpha: 1.0))
        }
    }
    static var systemGray4: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemGray4
        } else {
            return color(named: "systemGray4", fallback: #colorLiteral(red: 0.8196078431372549, green: 0.8196078431372549, blue: 0.8392156862745098, alpha: 1.0))
        }
    }
    static var systemGray5: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemGray5
        } else {
            return color(named: "systemGray5", fallback: #colorLiteral(red: 0.8980392156862745, green: 0.8980392156862745, blue: 0.9176470588235294, alpha: 1.0))
        }
    }
    static var systemGray6: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemGray6
        } else {
            return color(named: "systemGray6", fallback: #colorLiteral(red: 0.9490196078431372, green: 0.9490196078431372, blue: 0.9686274509803922, alpha: 1.0))
        }
    }
    static var label: UIColor {
        if #available(iOS 13, *) {
            return UIColor.label
        } else {
            return color(named: "label", fallback: #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
        }
    }
    static var secondaryLabel: UIColor {
        if #available(iOS 13, *) {
            return UIColor.secondaryLabel
        } else {
            return color(named: "secondaryLabel", fallback: #colorLiteral(red: 0.23529411764705882, green: 0.23529411764705882, blue: 0.2627450980392157, alpha: 0.6))
        }
    }
    static var tertiaryLabel: UIColor {
        if #available(iOS 13, *) {
            return UIColor.tertiaryLabel
        } else {
            return color(named: "tertiaryLabel", fallback: #colorLiteral(red: 0.23529411764705882, green: 0.23529411764705882, blue: 0.2627450980392157, alpha: 0.3))
        }
    }
    static var quaternaryLabel: UIColor {
        if #available(iOS 13, *) {
            return UIColor.quaternaryLabel
        } else {
            return color(named: "quaternaryLabel", fallback: #colorLiteral(red: 0.23529411764705882, green: 0.23529411764705882, blue: 0.2627450980392157, alpha: 0.18))
        }
    }
    static var link: UIColor {
        if #available(iOS 13, *) {
            return UIColor.link
        } else {
            return color(named: "link", fallback: #colorLiteral(red: 0.0, green: 0.47843137254901963, blue: 1.0, alpha: 1.0))
        }
    }
    static var placeholderText: UIColor {
        if #available(iOS 13, *) {
            return UIColor.placeholderText
        } else {
            return color(named: "placeholderText", fallback: #colorLiteral(red: 0.23529411764705882, green: 0.23529411764705882, blue: 0.2627450980392157, alpha: 0.3))
        }
    }
    static var separator: UIColor {
        if #available(iOS 13, *) {
            return UIColor.separator
        } else {
            return color(named: "separator", fallback: #colorLiteral(red: 0.23529411764705882, green: 0.23529411764705882, blue: 0.2627450980392157, alpha: 0.29))
        }
    }
    static var opaqueSeparator: UIColor {
        if #available(iOS 13, *) {
            return UIColor.opaqueSeparator
        } else {
            return color(named: "opaqueSeparator", fallback: #colorLiteral(red: 0.7764705882352941, green: 0.7764705882352941, blue: 0.7843137254901961, alpha: 1.0))
        }
    }
    static var systemBackground: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemBackground
        } else {
            return color(named: "systemBackground", fallback: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
    }
    static var secondarySystemBackground: UIColor {
        if #available(iOS 13, *) {
            return UIColor.secondarySystemBackground
        } else {
            return color(named: "secondarySystemBackground", fallback: #colorLiteral(red: 0.9490196078431372, green: 0.9490196078431372, blue: 0.9686274509803922, alpha: 1.0))
        }
    }
    static var tertiarySystemBackground: UIColor {
        if #available(iOS 13, *) {
            return UIColor.tertiarySystemBackground
        } else {
            return color(named: "tertiarySystemBackground", fallback: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
    }
    static var systemGroupedBackground: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemGroupedBackground
        } else {
            return color(named: "systemGroupedBackground", fallback: #colorLiteral(red: 0.9490196078431372, green: 0.9490196078431372, blue: 0.9686274509803922, alpha: 1.0))
        }
    }
    static var secondarySystemGroupedBackground: UIColor {
        if #available(iOS 13, *) {
            return UIColor.secondarySystemGroupedBackground
        } else {
            return color(named: "secondarySystemGroupedBackground", fallback: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
    }
    static var tertiarySystemGroupedBackground: UIColor {
        if #available(iOS 13, *) {
            return UIColor.tertiarySystemGroupedBackground
        } else {
            return color(named: "tertiarySystemGroupedBackground", fallback: #colorLiteral(red: 0.9490196078431372, green: 0.9490196078431372, blue: 0.9686274509803922, alpha: 1.0))
        }
    }
    static var systemFill: UIColor {
        if #available(iOS 13, *) {
            return UIColor.systemFill
        } else {
            return color(named: "systemFill", fallback: #colorLiteral(red: 0.47058823529411764, green: 0.47058823529411764, blue: 0.5019607843137255, alpha: 0.2))
        }
    }
    static var secondarySystemFill: UIColor {
        if #available(iOS 13, *) {
            return UIColor.secondarySystemFill
        } else {
            return color(named: "secondarySystemFill", fallback: #colorLiteral(red: 0.47058823529411764, green: 0.47058823529411764, blue: 0.5019607843137255, alpha: 0.16))
        }
    }
    static var tertiarySystemFill: UIColor {
        if #available(iOS 13, *) {
            return UIColor.tertiarySystemFill
        } else {
            return color(named: "tertiarySystemFill", fallback: #colorLiteral(red: 0.4627450980392157, green: 0.4627450980392157, blue: 0.5019607843137255, alpha: 0.12))
        }
    }
    static var quaternarySystemFill: UIColor {
        if #available(iOS 13, *) {
            return UIColor.quaternarySystemFill
        } else {
            return color(named: "quaternarySystemFill", fallback: #colorLiteral(red: 0.4549019607843137, green: 0.4549019607843137, blue: 0.5019607843137255, alpha: 0.08))
        }
    }
    static var lightText: UIColor {
        if #available(iOS 13, *) {
            return UIColor.lightText
        } else {
            return color(named: "lightText", fallback: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.6))
        }
    }
    static var darkText: UIColor {
        if #available(iOS 13, *) {
            return UIColor.darkText
        } else {
            return color(named: "darkText", fallback: #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
        }
    }

}
