//
//  ContentView.swift
//  macthx
//
//  Created by Pokras, Aarik on 9/4/24.
//

import SwiftUI
import AppKit
import Cocoa

struct ContentView: View {
    @State private var one: String = "John"
    @State private var two: String = ""
    @State private var thr: String = ""
    @State private var fou: String = ""
    @State private var fiv: String = ""
    @State private var six: String = ""
    @State private var sev: String = ""
    @State private var eig: String = ""
    @State private var tbd: String = ""
    
    @State private var article: String = ""
    
    @State private var email: String = "person@example.com"
    
    var body: some View {
        VStack {
            TextField(
                "Person you're writing to",
                text: $one
            )
            TextField(
                "Gift you got from " + one,
                text: $two
            )
            TextField(
                "The kind of party you invited " + one + " to (e.g. birthday)",
                text: $thr
            )
            TextField(
                "Your name",
                text: $fou
            )
            TextField(
                "What relationship " + one + " has with you (e.g. friend)",
                text: $fiv
            )
            TextField(
                "How you would describe your " + fiv + " " + one + " (e.g. special)",
                text: $six
            )
            TextField(
                "What you like to do with " + one + " (e.g. hanging out)",
                text: $sev
            )
            TextField(
                "The closing you'd like to use (e.g. From, Sincerely)",
                text: $eig
            )
            Text(
                "Your letter is complete!"
            )
            
        }
        .padding()
        .frame(width: 400)
//        .offset(x: -200)
        VStack{
            
            let txtt = """
            Dear \(one),
            Thank you so much for getting me my \(two)! Thank you for coming to my \(thr). I enjoy \(sev) with you.
            You are a \(six) \(fiv)!
            
            \(eig),
            \(fou)
            """
            
            Text(txtt)
            Button(action: {
                let cb = NSPasteboard.general
                cb.clearContents()
                cb.setString(txtt, forType: .string)
            }) {
                Label("Copy", systemImage: "clipboard")
            }
            TextField(
                "Email address of recipient",
                text: $email
            ).frame(width: 250)
            Link("Email", destination: URL(string: "mailto:" + email)!)
        }
        .textSelection(.enabled)
        .padding()
    }
}

struct NewWindow: View {
    var body: some View {
        Text("hello")
    }
}

func neww() {
    let nview = NewWindow()
    let ctrl = NSHostingController(rootView: nview)
    let win = NSWindow(
        contentRect: NSRect(x: 200, y: 200, width: 200, height: 200),
        styleMask: [.titled, .closable],
        backing: .buffered,
        defer: false
    )
    win.contentView = ctrl.view
    win.makeKeyAndOrderFront(nil)
}

#Preview {
    ContentView()
}
