//
//  main.swift
//  librias
//
//  Created by Filippo Tortomasi on 2020-05-23.
//  Copyright © 2020 Filippo Tortomasi. All rights reserved.
//

import Cocoa

func readDarkmode() -> String {
    if #available(OSX 10.15, *) {
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
