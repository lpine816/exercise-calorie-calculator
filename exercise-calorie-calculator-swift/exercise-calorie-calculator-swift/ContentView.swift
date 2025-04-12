//
//  ContentView.swift
//  exercise-calorie-calculator-swift
//
//  Created by Karla Mazariego on 4/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    @State var age: String = "20"
    @State var weight: String = "75"
    @State var gender: String = "Female"
    @State var exercise_time: String = "0"
    @State var avg_heart_rate: String = "70"
    @State var calories_text: String = "... calories burned."
    
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            Form{
                VStack{
                    Text("Enter Personal Info")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 50)
                    
                        HStack {
                            Text("Your age:")
                            .font(.title)
                            TextField("Enter your age here", text: self.$age)
                                .font(.title)
                    }
                    
                    HStack{
                        Text("Your weight: ")
                        .font(.title)
                        TextField("Enter your weight here", text: self.$weight)
                            .font(.title)
                    }
                    .padding(.bottom, 50)
                    
                    Picker(selection: $gender, label: Text("Please select your gender")){
                        Text("Lady").tag("Female")
                        Text("Gentleman").tag("Male")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 50)
                    
                    Text("Please advance to the next tab to enter your exercise info...")
                        .font(.title)
                        .background(Color.yellow)
                        .foregroundColor(Color.blue)
                }
            }
            
            .tabItem{
                VStack{
                    Image("first")
                    Text("Enter personal info")
                }
            }
            .tag(0)
            
            Form{
                VStack{
                    
                    Text("Enter Exercise Info")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 50)
                    
                    HStack{
                        Text("Exercise time:")
                            .font(.title)
                        TextField("Enter your exercise time here", text: self.$exercise_time)
                            .font(.title)
                    }
                    
                    HStack{
                        Text("Heart rate:")
                            .font(.title)
                        TextField("Enter your average heart rate here", text: self.$avg_heart_rate)
                            .font(.title)
                    }
                    .padding(.bottom, 50)
                    Text("Please advance to the next tab to calculate the calories...")
                        .font(.title)
                        .background(Color.yellow)
                        .foregroundColor(Color.blue)
                }
            }
            
            .tabItem{
                VStack{
                    Image("second")
                    Text("Enter exercise info")
                }
            }
            .tag(1)
            
            VStack{
                Text("Display Results")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 50)
                
                Button(action: {
                    let weight_float = Float(self.weight)
                    let age_float = Float(self.age)
                    let heart_rate_float = Float(self.avg_heart_rate)
                    let exercise_time_float = Float(self.exercise_time)
                    var caloriesBurned: Float = 0.0
                    
                    switch self.gender{
                    case "Female":
                        caloriesBurned = ((age_float! * 0.074) - (weight_float! * 0.05741) + (heart_rate_float! * 0.4472) - 20.4022) * exercise_time_float! / 4.184
                    case "Male":
                        caloriesBurned = ((age_float! * 0.2017) - (weight_float! * 0.09036) + (heart_rate_float! * 0.6309) - 55.0969) * exercise_time_float! / 4.184
                    default:
                        return
                    }
                    self.calories_text = String(Int(caloriesBurned)) + " calories burned"
                }) {
                    Text("Click here to calculate")
                        .font(.title)
                }
                .padding(.bottom, 50)
                
                Text(self.calories_text)
                    .font(.title)
            }
            
            .tabItem{
                VStack{
                    Image("first")
                    Text("Calculate calories")
                }
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
