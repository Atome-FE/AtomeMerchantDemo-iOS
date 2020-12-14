
import UIKit

extension UIColor {
    // 蓝色
    static let brand: UIColor = UIColor(hex: 0x0998ff)
//    static let brand : UIColor = UIColor(hex: 0xf6ff7e)
    // 黄色 主色调
    static let canary: UIColor = UIColor(hex: 0xf0ff5f)
    // 黄色 button
    static let yellowishTan: UIColor = UIColor(hex: 0xf6ff7e)
    static let whiteTwo: UIColor = UIColor(hex: 0xf8f8f8)
    static let offWhite: UIColor = UIColor(hex: 0xfffdf6)
    static let darkBlack: UIColor = UIColor(hex: 0x141c30)
    static let grey: UIColor = UIColor(hex: 0x878d9c)
    static let light: UIColor = UIColor(hex: 0xe6e8f5)
    static let brightLight: UIColor = UIColor(hex: 0xf7f8ff)
    static let darkGray: UIColor = UIColor(hex: 0x3e4459)
    static let lightGrey: UIColor = UIColor(hex: 0xcfd2e3)
    static let deepYellow: UIColor = UIColor(hex: 0xe9a106)
    static let green: UIColor = UIColor(hex: 0x25bc73)
    static let systemRed: UIColor = UIColor(hex: 0xe13f3f)
    static let paleGrey: UIColor = UIColor(red: 244.0 / 255.0, green: 245.0 / 255.0, blue: 1, alpha: 1.0)
    static let paleGreyTwo: UIColor = UIColor(hex: 0xfafbff)
    static let azure: UIColor = UIColor(red: 9.0 / 255.0, green: 152.0 / 255.0, blue: 1.0, alpha: 1.0)
    static let iceBlue: UIColor = UIColor(hex: 0xeef2f6)
    static let blueGrey: UIColor = UIColor(red: 135.0 / 255.0, green: 141.0 / 255.0, blue: 156.0 / 255.0, alpha: 1.0)
    static let blueyGrey: UIColor = UIColor(hex: 0x9ca2b0)

    @nonobjc class var grey29: UIColor {
      return UIColor(red: 135.0 / 255.0, green: 141.0 / 255.0, blue: 156.0 / 255.0, alpha: 0.29)
    }
    @nonobjc class var dark: UIColor {
        return UIColor(red: 20.0 / 255.0, green: 28.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var azureTwo: UIColor {
      return UIColor(red: 0.0, green: 164.0 / 255.0, blue: 1.0, alpha: 1.0)
    }

    @nonobjc class var salmon: UIColor {
      return UIColor(red: 254.0 / 255.0, green: 122.0 / 255.0, blue: 104.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var lightishBlue: UIColor {
      return UIColor(red: 59.0 / 255.0, green: 109.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var goldenrod: UIColor {
      return UIColor(red: 248.0 / 255.0, green: 199.0 / 255.0, blue: 5.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var goldenYellow: UIColor {
      return UIColor(red: 248.0 / 255.0, green: 203.0 / 255.0, blue: 23.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var darkBlueGrey: UIColor {
      return UIColor(red: 19.0 / 255.0, green: 31.0 / 255.0, blue: 55.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var vividBlue: UIColor {
      return UIColor(red: 34.0 / 255.0, green: 71.0 / 255.0, blue: 1.0, alpha: 1.0)
    }

}

extension UIColor {

    // hexColor
    convenience init(hex: UInt32, alpha: CGFloat = 1) {
        let r: CGFloat = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g: CGFloat = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b: CGFloat = CGFloat((hex & 0x0000FF)) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

    /// 16进制
    convenience init(hexRed: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.init(red: hexRed/0xFF, green: green/0xFF, blue: blue/0xFF, alpha: alpha)
    }

    /// 随机色函数(alpha值)
    public class func random(alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: alpha)
    }

    /// create a image with pure color
    /// 纯色图片
    ///
    /// 由颜色生成图片
    ///
    func image(size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        UIGraphicsBeginImageContext(size)                                           // 开始绘制
        let context = UIGraphicsGetCurrentContext()                                 // 读取上下文
        context?.setFillColor(self.cgColor)                                         // 设置填充色
        context?.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))   // 进行填充
        let image = UIGraphicsGetImageFromCurrentImageContext()                     // 转为image格式
        UIGraphicsEndImageContext()                                                 // 结束绘制
        return image
    }
}
