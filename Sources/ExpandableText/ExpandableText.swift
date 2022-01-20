//
// ExpandableText.swift
//
//
//  Created by 이웅재 on 2021/10/12.
//

import SwiftUI

public struct ExpandableText: View {
    var text : AttributedString
    
    var font: Font = .body
    var lineLimit : Int = 3
    var foregroundColor : Color = .primary
    
    var expandButtonText : String = "more"
    var expandButtonColor : Color = .blue
    var generalFont: GeneralFont = GeneralFont.preferredFont(forTextStyle: GeneralFont.TextStyle.body)
    @State private var expand : Bool = false
    @State private var truncated : Bool = false
    @State private var size : CGFloat = 0
    
    
    public init(text: String) {
        self.text = AttributedString(text)
    }
    public init(attributedString text: AttributedString) {
        self.text = text
    }
    public var body: some View {
        ZStack(alignment: .bottomTrailing){
            Text(text)
                .font(font)
                .foregroundColor(foregroundColor)
                .lineLimit(expand == true ? nil : lineLimit)
                .mask(
                    VStack(spacing: 0){
                        Rectangle()
                            .foregroundColor(.black)
                        
                        HStack(spacing: 0){
                            Rectangle()
                                .foregroundColor(.black)
                            if !expand && truncated{
                                HStack(alignment: .bottom,spacing: 0){
                                    LinearGradient(
                                        gradient: Gradient(stops: [
                                            Gradient.Stop(color: .black, location: 0),
                                            Gradient.Stop(color: .clear, location: 0.8)]),
                                        startPoint: .leading,
                                        endPoint: .trailing)
                                        .frame(width: 32, height: expandButtonText.heightOfString(usingFont: generalFont))
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: expandButtonText.widthOfString(usingFont: generalFont), alignment: .center)
                                }
                            }
                        }
                        .frame(height: expandButtonText.heightOfString(usingFont: generalFont))
                    }
                )
            
            if truncated && !expand {
                Button(action: {
                    self.expand = true
                }, label: {
                    Text(expandButtonText)
                        .font(font)
                        .foregroundColor(expandButtonColor)
                })
            }
        }
        .background(
            Text(text)
                .lineLimit(lineLimit)
                .background(GeometryReader { geo in
                    Color.clear.onAppear() {
                        let size = CGSize(width: geo.size.width, height: .greatestFiniteMagnitude)
                        
//                        let attributes:[NSAttributedString.Key:Any] = [NSAttributedString.Key.font: generalFont]
//                        let attributedText = NSAttributedString(string: text, attributes: attributes)
                        
                        let attributedText = NSAttributedString(text)
                        #if os(macOS)
                        let option = NSString.DrawingOptions.usesLineFragmentOrigin
                        #elseif os(iOS)
                        let option = NSStringDrawingOptions.usesLineFragmentOrigin
                        #endif
                        let textSize = attributedText.boundingRect(with: size, options: option, context: nil)
                        
                        if textSize.size.height > geo.size.height {
                            truncated = true
                            
                            self.size = textSize.size.height
                        }
                    }
                })
                .hidden()
        )
    }
}
