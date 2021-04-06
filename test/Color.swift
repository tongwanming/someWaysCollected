// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  public typealias Color = UIColor
#elseif os(OSX)
  import AppKit.NSColor
  public typealias Color = NSColor
#endif

public
extension Color {
  public convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
    
  public convenience init(rgbValue: UInt32) {
    let red   = CGFloat((rgbValue >> 16) & 0xff) / 255.0
    let green = CGFloat((rgbValue >>  8) & 0xff) / 255.0
    let blue  = CGFloat((rgbValue      ) & 0xff) / 255.0
    
    self.init(red: red, green: green, blue: blue, alpha: 1)
  }
}

// swiftlint:disable file_length
// swiftlint:disable type_body_length
public
enum ColorG {
    //中性色90%
    case rgbC0
    case rgbC3
    case rgbC6
    case rgbC9
    case rgbCC
    case rgbCF
    
    case rgbCH
    case rgbCHL
    case rgbCL
    case rgbBG
    
    //theme color
    case rgbCR
    case rgbCB
    
    //gt
    case rgbCR0
    case rgbCB0
    
    //lottery
    case rgbCR1
    case rgbCB1
    
    //merchant
    case rgbCR2
    case rgbCB2

  var rgbaValue: UInt32 {
    switch self {
    case .rgbC0: return 0x000000ff
    case .rgbC3: return 0x333333ff
    case .rgbC6: return 0x666666ff
    case .rgbC9: return 0x999999ff
    case .rgbCC: return 0xccccccff
    case .rgbCF: return 0xffffffff
        
    case .rgbCH: return 0xf6f6f7ff
    case .rgbCHL: return 0xa7a7aaff
    case .rgbCL: return 0xe5e5e5ff
    case .rgbBG: return 0xf5f5f5ff
        
    case .rgbCR0: return 0xff4400ff
    case .rgbCB0: return 0x28a6f7ff
    case .rgbCR1: return 0xf33d55ff
    case .rgbCB1: return 0x3399ffff
    case .rgbCR2: return 0xff2200ff
    case .rgbCB2: return 0x007dd6ff
        
//    case .articleBody: return 0x339666ff
//    case .articleFootnote: return 0xff66ccff
//    case .articleTitle: return 0x33fe66ff
//    case .cyanColor: return 0xff66ccff
//    case .themeColor: return 0xf33d55ff
//    case .translucent: return 0xffffffcc
//    case .whiteColor: return 0xffffffff
//    case .yellowColor: return 0xffffffa0
//    
//    case .rgbCHB: return 0x0077ccff
    case .rgbCB: return 0x3399ffff
    case .rgbCR: return 0xf33d55ff
    }
  }

  public var color: Color {
    return Color(named: self)
  }
}
// swiftlint:enable type_body_length

extension Color {
  convenience init(named name: ColorG) {
    self.init(rgbaValue: name.rgbaValue)
  }
}
