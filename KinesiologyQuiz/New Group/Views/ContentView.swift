//
//  ContentView.swift
//  KinesiologyQuiz
//
//  Created by Abdul Malik on 2021-12-10.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    //This is the quiz we are currently quizzing on
    @State var currentQuiz: Quiz = listOfQuiz.randomElement()!
    //This is the prior quiz that we showed
    @State var previousQuiz: Quiz = listOfQuiz.randomElement()!
    //This controls whether the answer is visible
    @State var isAnswerShowing = false
    
    // MARK: Computed properties
    var body: some View {
        VStack(spacing: 25) {
            
            DiagramView(image: "skeleton",
                        horizontalPadding: 50)
            
            HStack{
            Text("Question:")
                .font(.title)
                .bold()
                Spacer()
            }
            
            
            //Output
            Text(currentQuiz.question)
              //  .font(.subheadline)
            
            // Input
            TextField("This argument should the describe the purpose of the text field within the context of your app, e.g.: 'Name' or 'Email Address'",
                      text: .constant(""),
                      prompt: Text("Type answer..."))
            
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
            Text(currentQuiz.answer)
            //  .font(.title)
            //              CONDITION     True  False
                .opacity(isAnswerShowing ? 1.0 : 0.0)
            
            
            //Input
            Button(action: {
                
                // previousquiz = listOfQuiz.randomElement()!
                
                //Hide the answer
                //withAnimation {
                isAnswerShowing = false
                //}
                
                // Pick a new Quiz
                currentQuiz = listOfQuiz.randomElement()!
                
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
