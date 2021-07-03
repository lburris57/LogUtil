//
//  ContentView.swift
//  LogUtil
//
//  Created by Larry Burris on 7/2/21.
//
import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        VStack
        {
            Text("Hello, world!")
                .padding()
            
            Button("Print Log")
            {
                printLog()
            }
        }
    }

    func printLog()
    {
        Log.info("Slow networking connectivity detected.")
        Log.warning("Username should not be nil.")
        Log.error("User authentication failed.")
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
