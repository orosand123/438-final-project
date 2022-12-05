//
//  debugLog.swift
//  arsimplegeolocation
//
//  Used public AR Geo Mapping Repo with permission from Yasuhito Nagatomo on 2022/06/18.
//

import Foundation

func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    Swift.print("ASG : \(items.first ?? "")")
}

#if !DEBUG

// func print(_ items: Any..., separator: String = " ", terminator: String = "\n") { }
func debugPrint(_ items: Any..., separator: String = " ", terminator: String = "\n") { }

@discardableResult
func dump<T>(_ value: T, name: String? = nil, indent: Int = 0, maxDepth: Int = .max, maxItems: Int = .max) -> T {
    return value }

func debugLog(_ items: Any..., separator: String = " ", terminator: String = "\n") { }

#else

func debugLog(_ items: Any..., separator: String = " ", terminator: String = "\n",
              function: String = #function, file: String = #file, line: Int = #line) {
    let url = URL(fileURLWithPath: file)
    let filename = url.lastPathComponent
    let thread = Thread.isMainThread ? "(m)" : "(-)"
    Swift.print("[@Log] : \(filename): L\(line): T\(thread): \(items.first ?? "")",
                separator: separator, terminator: terminator)
}

#endif
