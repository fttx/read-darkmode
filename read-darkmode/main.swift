//
//  main.swift
//  librias
//
//  Created by Filippo Tortomasi on 2020-05-23.
//  Copyright © 2020 Filippo Tortomasi. All rights reserved.
//

import Cocoa

func readDarkmode() -> String {
    /*
     #available doesn't allow to check the Major version, it must be hard-coded.
     Problem: if the OS is updated to a new major version, eg. 13, this function will always return "light".
     
     10.14 = Mojave, 10.15 = Catalina, 11.0 = Big Sur (M1), 12.0 = ?? Future compatibility */
    if #available(OSX 10.15, *), #available(OSX 11.0, *), #available(OSX 12.0, *) {
        let appearanceDescription = NSApplication.shared.effectiveAppearance.debugDescription.lowercased()
       
        if appearanceDescription.contains("dark") {
            return "dark";
        }
    } else if #available(OSX 10.14, *) {
        if let appleInterfaceStyle = UserDefaults.standard.object(forKey: "AppleInterfaceStyle") as? String {
            
            if appleInterfaceStyle.lowercased().contains("dark") {
                return "dark"
            }
        }
    }
    return "light";
}

print(readDarkmode())
