//
//  Underline.swift
//  FamousPlaces
//
//  Created by Bhushan Tambe on 30/03/23.
//


import SwiftUI

struct Underline: View {
    var body: some View {
        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.pink)
                            .padding(.leading, 50)
                            .padding(.trailing, 40)
    }
}

struct Underline_Previews: PreviewProvider {
    static var previews: some View {
        Underline()
    }
}

