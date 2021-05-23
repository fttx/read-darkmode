//
//  main.swift
//  librias
//
//  Created by Filippo Tortomasi on 2020-05-23.
//  Copyright © 2020 Filippo Tortomasi. All rights reserved.
//

import Cocoa

func readDarkmode() -> String {
    
    // 10.14 = Mojave, 10.15 = Catalina, 10.16 = Big Sur (named 11.x)
    if #available(OSX 10.16, *) {
        _ = NSApplication.shared.effectiveAppearance.debugDescription.lowercased()
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        let appearanceName = item.button?.effectiveAppearance.name
        if let name = appearanceName?.rawValue.lowercased(),name.contains("dark") {
            return "dark";
        }
    }
    else if #available(OSX 10.15, *) {
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
