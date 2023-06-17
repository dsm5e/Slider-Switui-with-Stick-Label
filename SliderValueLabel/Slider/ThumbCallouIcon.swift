//
//  ThumbCallouIcon.swift
//  SliderValueLabel
//
//  Created by dsm 5e on 18.06.2023.
//

import SwiftUI

struct CalloutIcon: View {

    @Binding var value: Double
    
    var body: some View {
        VStack(spacing: 0) {
            
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(Color.black)
                .frame(width: 45, height: 30)
                .overlay {
                    Text("\(value,specifier: "%.f") km")
                        .font(.caption)
                        .foregroundColor(Color.white)
                }
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.black)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -2)
                .padding(.bottom, 40)
        }
    }
}

struct CalloutIcon_Previews: PreviewProvider {
    static var previews: some View {
        CalloutIcon(value: .constant(60))
    }
}
