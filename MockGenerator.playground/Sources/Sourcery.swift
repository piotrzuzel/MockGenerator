import Foundation
import Cocoa

let sourcesFilename = "ToGenerate"
let stencilFilename = "AutoMockable"
let sourceryFilename = "sourcery"
let scriptsDirectory = "Scripts"

public class Sourcery {
    private let resourcesURL: URL
    private let sourceryScriptURL: URL
    private let stencilDirectoryURL: URL
    
    public init() {
        guard let resourcesURL = Bundle.main.url(forResource: sourcesFilename, withExtension: nil)?.deletingLastPathComponent() else {
            fatalError("\(sourcesFilename) file not found in main bundle.")
        }
        self.resourcesURL = resourcesURL
        
        guard let sourceryScriptURL = Bundle.main.url(forResource: sourceryFilename, withExtension: "sh", subdirectory: scriptsDirectory) else {
            fatalError("\(sourceryFilename) file not found in main bundle's Scripts directory.")
        }
        self.sourceryScriptURL = sourceryScriptURL
        
        guard let stencilDirectoryURL = Bundle.main.url(forResource: stencilFilename, withExtension: "stencil", subdirectory: scriptsDirectory) else {
            fatalError("\(sourceryFilename) file not found in main bundle's Scripts directory.")
        }
        self.stencilDirectoryURL = stencilDirectoryURL
    }
    
    public func generate() {
        let process = Process()
        
        process.launchPath = sourceryScriptURL.path
        process.arguments = [resourcesURL.path, stencilDirectoryURL.path]
        
        process.launch()
    }
}
