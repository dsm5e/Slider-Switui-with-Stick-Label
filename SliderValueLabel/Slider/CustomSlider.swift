//
//  Slider.swift
//  SliderValueLabel
//
//  Created by dsm 5e on 17.06.2023.
//

import SwiftUI

struct CustomSlider: View {
    @State private var speed = 50.0
    
    var minValue: Double = 0
    var maxValue: Double = 50
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Distance")
                .font(.headline)
            Text("Display all coupons within filtere radius ")
                .foregroundColor(.gray)
                .font(.subheadline)
                .padding(.bottom, 20)
            HStack {
                Slider(value: $speed, in: minValue...maxValue, step: 1)
                    .tint(.black)
                    .padding(.top)
                    .overlay(GeometryReader { gp in
                        if speed == 0 {
                        } else {
                                CalloutIcon(value: $speed)
                                    .offset(x: speed == 0 ? 0 : (speed < 25 ? CGFloat(-10 + 10 * speed / 25) : CGFloat(10 * (speed - 25) / 25)), y: -25)
                                    .alignmentGuide(HorizontalAlignment.leading) { $0[HorizontalAlignment.leading] - (gp.size.width - $0.width) * (speed - minValue) / (maxValue - minValue) }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }, alignment: .top)
                    .animation(speed < 2 ? .spring() : nil)
            }
            HStack {
                Text("\(minValue,specifier: "%.f") km")
                Spacer()
                Text("\(maxValue,specifier: "%.f") km")
            }
            .foregroundColor(Color.gray.opacity(0.5))
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding()
    }
}

struct TestValueLabelWithSliderNob_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider()
    }
}
