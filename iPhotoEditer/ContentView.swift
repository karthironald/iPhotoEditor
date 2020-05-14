//
//  ContentView.swift
//  iPhotoEditer
//
//  Created by Karthick Selvaraj on 02/05/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI

let kPrimaryTitleFont = Font.system(.title, design: .rounded)
let kPrimaryLargeTitleFont = Font.system(.largeTitle, design: .rounded)
let kPrimaryBodyFont = Font.system(.body, design: .rounded)

struct ContentView: View {
    
    @State private var imageToEdit: Image? = Image("karthick")
    @State private var isPresented = false
    
    @State private var showBrightnessSlider = false
    @State private var showContrastSlider = false
    @State private var showSaturationSlider = false
    @State private var showGrayscaleSlider = false
    
    @State private var brightnessValue: CGFloat = 0.0
    @State private var contrastValue: CGFloat = 1.0
    @State private var saturationValue: CGFloat = 0.0
    @State private var grayscaleValue: CGFloat = 0.0
    
    var brightnessDoubleValue: Double {
        return Double(brightnessValue)
    }
    var contrastDoubleValue: Double {
        return Double(contrastValue)
    }
    
    var saturationDoubleValue: Double {
        return Double(saturationValue)
    }
    
    var grayscaleDoubleValue: Double {
        return Double(grayscaleValue)
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    self.imageToEdit!
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height / 1.70)
                        .background(Color.red)
                        .brightness(self.brightnessDoubleValue)
                        .contrast(self.contrastDoubleValue)
                        .saturation(self.saturationDoubleValue)
                        .grayscale(self.grayscaleDoubleValue)
                        .clipped()
                    EditOptionsView(showBrightnessSlider: self.$showBrightnessSlider, showContrastSlider: self.$showContrastSlider, showSaturationSlider: self.$showSaturationSlider, showGrayscaleSlider: self.$showGrayscaleSlider)
                    Group {
                        if self.showBrightnessSlider {
                            Slider(value: self.$brightnessValue, in: -1...1, label: {
                                Text("Brightness")
                            })
                        }
                        if self.showContrastSlider {
                            Slider(value: self.$contrastValue, in: -10...10, label: {
                                Text("Contrast")
                            })
                        }
                        if self.showSaturationSlider {
                            Slider(value: self.$saturationValue, in: -10...10, label: {
                                Text("Saturation")
                            })
                        }
                        if self.showGrayscaleSlider {
                            Slider(value: self.$grayscaleValue, in: -1...1, label: {
                                Text("Gray Scale")
                            })
                        }
                    }
                    .padding([.leading, .trailing, .bottom])
                    .accentColor(.orange)
                    Spacer()
                }
                .navigationBarTitle(Text("iPhotoEditor"), displayMode: .inline)
                .navigationBarItems(
                    leading: Button(action: {
                        withAnimation {
                            self.brightnessValue = 0.0
                            self.contrastValue = 1.0
                            self.saturationValue = 0.0
                            self.grayscaleValue = 0.0
                            self.showBrightnessSlider = false
                            self.showContrastSlider = false
                            self.showSaturationSlider = false
                            self.showGrayscaleSlider = false
                        }
                    }, label: {
                        Text("Reset")
                            .font(kPrimaryBodyFont)
                            .bold()
                            .foregroundColor(.orange)
                    }),
                    trailing: Button(action: {
                        self.isPresented.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(kPrimaryBodyFont)
                            .imageScale(.large)
                            .foregroundColor(.orange)
                    }).sheet(isPresented: self.$isPresented, content: {
                        ImagePickerView(image: self.$imageToEdit, isPresented: self.$isPresented)
                    }))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
