import SwiftUI

enum Theme: String {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    var mainColor: Color {
        switch self {
        case .bubblegum: return Color.pink
        case .buttercup: return Color.yellow
        case .indigo: return Color.indigo
        case .lavender: return Color.purple
                .opacity(0.6)
        case .magenta: return Color.purple
        case .navy: return Color.blue
        case .orange: return Color.orange
        case .oxblood: return Color.red
        case .periwinkle: return Color.blue.opacity(0.6)
        case .poppy: return Color.red.opacity(0.8)
        case .purple: return Color.purple.opacity(0.8)
        case .seafoam: return Color.green.opacity(0.7)
        case .sky: return Color.blue.opacity(0.4)
        case .tan: return Color.brown
        case .teal: return Color.teal
        case .yellow: return Color.yellow.opacity(0.9)
        }
    }
}

