//
//  testUI.swift
//  RecordYourSets
//
//  Created by José Guerra on 03-05-23.
//
import Collections
import SwiftUI

struct Entity: Hashable {
    let id = UUID()
    let reps: Int
    let kgs: Double
    let date: Date
}

struct Algo {

    let date: Int
    let object: [Entity]
    
}

struct testUI: View {
    
    @State var exercises: [Entity] = [Entity(reps: 10, kgs: 10.5, date: Date.now), Entity(reps: 10, kgs: 11.5, date: Date.now), Entity(reps: 30, kgs: 10.5, date: Date.init(timeIntervalSinceNow: 100000)), Entity(reps: 10, kgs: 12.5, date: Date.now),Entity(reps: 20, kgs: 10.5, date: Date.init(timeIntervalSinceNow: -100000)),  Entity(reps: 20, kgs: 10.5, date: Date.init(timeIntervalSinceNow: -100000)), Entity(reps: 20, kgs: 10.5, date: Date.init(timeIntervalSinceNow: -100000))]
    
    @State var items = [[Entity]]()

    
    var body: some View {
        
        
        VStack {
            
            List {

                ForEach(items, id: \.self) { ex in

                    Section {
                        ForEach(ex, id: \.self) { exo in
                            HStack {
                                Text("\(exo.date, format: .dateTime.day().month())")
                                }
                            }
                    } header: {
                        Text("\(ex.first!.date, format: .dateTime.day().month())")
                    }


                }


                
            }
            .onAppear {
                self.items = sortDates(sets: exercises)
                
            }
        }

    }
    
    func sortDates(sets: [Entity]) -> [[Entity]] {

        var datesRegistered: [Int] = []
        var arrays: [[Entity]] = []
        
        
        // con un Set se puede arrelgar esto...
        for exercise in exercises {
            
            var counter = 0
            var array: [Entity] = []
            
            if datesRegistered.contains(exercise.date.get(.day)) {
                counter += 1

            } else {
                datesRegistered.append(exercise.date.get(.day))
                array.append(exercise)
                
            }
        }
        
     
            
        for index in datesRegistered {
            
            var array: [Entity] = []
            
            for exercise in exercises {
                
                if exercise.date.get(.day) == index {
                    array.append(exercise)
                }
                
                
            }
            
            arrays.append(array)
        }
            
        
        
        //print(datesRegistered)
        return arrays
    }
    
    
}


struct componentView: View {

    var date: Date
    var kgs: Double
    
    var body: some View {
            
        
        Section {
            HStack {
                    Text("\(kgs, specifier: "%.1f")")
                    Text("\(date, format: .dateTime.hour())")
            }
        }
         
        
    }
    
    func getArrays() {
        
    }
}

struct testUI_Previews: PreviewProvider {
    static var previews: some View {
        testUI()
        //componentView()
    }
}
