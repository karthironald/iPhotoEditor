//
//  EditOptionsView.swift
//  iPhotoEditer
//
//  Created by Karthick Selvaraj on 02/05/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI

let editOptions = ["Brightness", "Contrast",  "Saturation", "Gray scale"]
let editOptionsImages: [String: String] = ["Brightness": "sun.max.fill", "Contrast": "moon.circle.fill",  "Saturation": "triangle", "Gray scale": "dial.fill"]

struct EditOptionsView: View {
    
    @Binding var showBrightnessSlider: Bool
    @Binding var showContrastSlider: Bool
    @Binding var showSaturationSlider: Bool
    @Binding var showGrayscaleSlider: Bool
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(editOptions, id: \.self) { option in
                            VStack {
                                Text(option)
                                    .font(kPrimaryBodyFont)
                                    .bold()
                                    .foregroundColor(self.color(for: option) ?? .black)
                                Image(systemName: editOptionsImages[option]!)
                                    .font(kPrimaryTitleFont)
                                    .imageScale(.medium)
                                    .foregroundColor(self.color(for: option) ?? .black)
                                    .padding()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(30.0)
                                    .overlay(Circle().strokeBorder(self.color(for: option) ?? Color.black, lineWidth: 2))
                                
                            }
                            .padding()
                            .onTapGesture {
                                withAnimation {
                                    switch option  {
                                    case "Brightness":
                                        self.showBrightnessSlider.toggle()
                                        self.showContrastSlider = false
                                        self.showSaturationSlider = false
                                        self.showGrayscaleSlider = false
                                    case "Contrast":
                                        self.showBrightnessSlider = false
                                        self.showContrastSlider.toggle()
                                        self.showSaturationSlider = false
                                        self.showGrayscaleSlider = false
                                    case "Saturation":
                                        self.showBrightnessSlider = false
                                        self.showContrastSlider = false
                                        self.showSaturationSlider.toggle()
                                        self.showGrayscaleSlider = false
                                    case "Gray scale":
                                        self.showBrightnessSlider = false
                                        self.showContrastSlider = false
                                        self.showSaturationSlider = false
                                        self.showGrayscaleSlider.toggle()
                                    default:
                                        self.showBrightnessSlider = false
                                        self.showContrastSlider = false
                                        self.showSaturationSlider = false
                                        self.showGrayscaleSlider = false
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(width: geo.size.width, height: 120)
                .clipped()
            }
        }
    }
    
    func color(for option: String) -> Color? {
        let selectionColour = Color.orange
        switch option {
        case "Brightness":
            if showBrightnessSlider { return selectionColour }
        case "Contrast":
            if showContrastSlider { return selectionColour }
        case "Saturation":
            if showSaturationSlider { return selectionColour }
        case "Gray scale":
            if showGrayscaleSlider { return selectionColour }
        default:
            return nil
        }
        return nil
    }
    
}

struct EditOptionsView_Previews: PreviewProvider {
    static let falseBinding: Binding = .constant(false)
    
    static var previews: some View {
        EditOptionsView(showBrightnessSlider: .constant(true), showContrastSlider: falseBinding, showSaturationSlider: falseBinding, showGrayscaleSlider: falseBinding)
    }
}
