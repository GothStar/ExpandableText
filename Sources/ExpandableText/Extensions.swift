//
//  Extensions.swift
//  
//
//  Created by 이웅재 on 2021/10/12.
//

import SwiftUI
#if os(iOS)
public typealias GeneralFont = UIFont
#elseif os(macOS)
public typealias GeneralFont = NSFont
#endif

extension ExpandableText {
    public func font(_ font: Font) -> ExpandableText {
        var result = self
        
        if #available(iOS 14.0, *) {
            switch font {
            case .largeTitle:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .largeTitle)
            case .title:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .title1)
            case .title2:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .title2)
            case .title3:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .title3)
            case .headline:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .headline)
            case .subheadline:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .subheadline)
            case .callout:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .callout)
            case .caption:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .caption1)
            case .caption2:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .caption2)
            case .footnote:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .footnote)
            case .body:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .body)
            default:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .body)
            }
        } else {
            switch font {
            case .largeTitle:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .largeTitle)
            case .title:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .title1)
                //            case .title2:
                //                result.uiFont = UIFont.preferredFont(forTextStyle: .title2)
                //            case .title3:
                //                result.uiFont = UIFont.preferredFont(forTextStyle: .title3)
            case .headline:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .headline)
            case .subheadline:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .subheadline)
            case .callout:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .callout)
            case .caption:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .caption1)
                //            case .caption2:
                //                result.uiFont = UIFont.preferredFont(forTextStyle: .caption2)
            case .footnote:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .footnote)
            case .body:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .body)
            default:
                result.generalFont = GeneralFont.preferredFont(forTextStyle: .body)
            }
        }
        result.font = font
        
        return result
    }
    public func lineLimit(_ lineLimit: Int) -> ExpandableText {
        var result = self
        
        result.lineLimit = lineLimit
        return result
    }
    
    public func foregroundColor(_ color: Color) -> ExpandableText {
        var result = self
        
        result.foregroundColor = color
        return result
    }
    
    public func expandButtonText(_ text: String) -> ExpandableText {
        var result = self
        
        result.expandButtonText = text
        return result
    }
    public func expandButtonColor(_ color: Color) -> ExpandableText {
        var result = self
        
        result.expandButtonColor = color
        return result
    }
}

extension String {
#if os(iOS)
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
#endif
#if os(macOS)
    func heightOfString(usingFont font: NSFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    func widthOfString(usingFont font: NSFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
#endif
    
    
}
