//
//  DiagramView.swift
//  KinesiologyQuiz
//
//  Created by Abdul Malik on 2021-12-10.
//

import SwiftUI

struct DiagramView: View {
    // MARK: Stored properties
    let image: String
    let horizontalPadding: Double
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            
            Spacer()
            
            Image(image)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, horizontalPadding)
            
            Spacer()

        }

    }
}

struct DiagramView_Previews: PreviewProvider {
    static var previews: some View {
        DiagramView(image: "skeleton",
                    horizontalPadding: 50)
    }
}
