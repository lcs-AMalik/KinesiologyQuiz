//
//  ContentView.swift
//  KinesiologyQuiz
//
//  Created by Abdul Malik on 2021-12-10.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    //This is the card we are currently quizzing on
    @State var currentCard: Quiz = listOfQuiz.randomElement()!
    //This is the prior card that we showed
    @State var previousCard: Quiz = listOfQuiz.randomElement()!
    //This controls whether the answer is visible
    @State var isAnswerShowing = false
    
    // MARK: Computed properties
    var body: some View {
        VStack(spacing: 25) {
            
            DiagramView(image: "skeleton",
                        horizontalPadding: 50)
            
            //Output
            Text(currentCard.question)
                .font(.largeTitle)
            
            //Input
            Button(action: {
                withAnimation {
                    isAnswerShowing = true
                }
                
            }, label: {
                Text("Check")
            })
                .buttonStyle(.bordered)
            
            //Output
            Text(currentCard.answer)
                .font(.title)
            //              CONDITION     True  False
                .opacity(isAnswerShowing ? 1.0 : 0.0)
            
            
            //Input
            Button(action: {
                
                // previousCard = listOfCards.randomElement()!
                
                //Hide the answer
                //withAnimation {
                isAnswerShowing = false
                //}
                
                // Pick a new Card
                currentCard = listOfQuiz.randomElement()!
                
                // print("Button was pressed")
            }, label: {
                Text("Another")
            })
                .buttonStyle(.bordered)
                .opacity(isAnswerShowing ? 1.0 : 0.0)
            Spacer()
            
        }
        .navigationTitle("Kinesiology Quiz")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
        
    }
}
