//
//  Log.swift
//  LogUtil
//
//  Created by Larry Burris on 7/2/21.
//
import Foundation

enum Log
{
    enum LogLevel
    {
        case info
        case warning
        case error
        
        fileprivate var prefix: String
        {
            switch self
            {
                case .info: return "ℹ️ INFO"
                case .warning: return "⚠️ WARN"
                case .error: return "🛑 ERROR"
            }
        }
    }
    
    struct Context
    {
        let file: String
        let function: String
        let line: Int
        
        var description: String
        {
            return "\((file as NSString).lastPathComponent):\(line) → Function: \(function)"
        }
    }
    
    static func info(_ descriptionString: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line)
    {
        let context = Context(file: file, function: function, line: line)
        
        Log.handleLog(level: .info, outputString: descriptionString, shouldLogContext: shouldLogContext, context: context)
    }
    
    static func warning(_ descriptionString: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line)
    {
        let context = Context(file: file, function: function, line: line)
        
        Log.handleLog(level: .warning, outputString: descriptionString, shouldLogContext: shouldLogContext, context: context)
    }
    
    static func error(_ descriptionString: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line)
    {
        let context = Context(file: file, function: function, line: line)
        
        Log.handleLog(level: .error, outputString: descriptionString, shouldLogContext: shouldLogContext, context: context)
    }
    
    fileprivate static func handleLog(level: LogLevel, outputString: String, shouldLogContext: Bool, context: Context)
    {
        let logComponents = ["[\(level.prefix)]", outputString]
        
        var logString = logComponents.joined(separator: " ")
        
        if(shouldLogContext)
        {
            logString += " → \(context.description)"
        }
        
        #if DEBUG
        print(logString)
        #endif
    }
}
