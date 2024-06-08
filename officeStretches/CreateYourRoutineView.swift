//
//  CreateYourRoutineView.swift
//  officeStretches
//
//  Created by Alex  on 7/6/24.
//

import SwiftUI

struct CreateYourRoutineView: View {
    @EnvironmentObject var vm: MainViewVM
    @ObservedObject var muscleExerciseListVM = MuscleExerciseListVM(muscleTag: .Biceps)
    @State var muscle: Muscles = .All
    
    var body: some View {
        VStack {
            Text("Your Routine")
            ResumeExerciseRoutineList(routineExercises: vm.myExervisListToSave)
                .frame(height: 200)
            Text("Exercise List")
            ScrollView {
                VStack {
                    ForEach(Muscles.allCases.dropLast()) { muscle in
                        DisclosureGroup {
                            ForEach(muscleExerciseListVM.exerciseDictionary[muscle] ?? []) { exercise in
                                HStack {
                                    Text(exercise.workOut)
                                    Spacer()
                                    Image(exercise.muscles.rawValue)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                    Button {
                                        vm.myExervisListToSave.append(exercise)
                                    } label: {
                                        Text("Add")
                                    }
                                }
                            }
                        } label: {
                            Text(muscle.rawValue)
                                .bold()
                                .tint(Color.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.4)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .padding(.horizontal)
                        
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.5)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

#Preview {
    CreateYourRoutineView()
        .environmentObject(MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
}
