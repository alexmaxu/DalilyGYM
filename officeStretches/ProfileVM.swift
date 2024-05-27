//
//  ProfileVM.swift
//  officeStretches
//
//  Created by Alex  on 27/5/24.
//

import Foundation

final class ProfileVM: ObservableObject{
    @Published var profile = Profile()
    
    init(profile: Profile = Profile()) {
        self.profile = profile
    }
}