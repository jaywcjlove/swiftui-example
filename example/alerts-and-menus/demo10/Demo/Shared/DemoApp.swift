//
//  DemoApp.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/26.
//

import SwiftUI

struct AppCommands: Commands {
    
    func action() {}
    func anotherAction() {}
    
    @CommandsBuilder var body: some Commands {
        CommandMenu("Menu") {
            Button(action: {
                action()
            }) {
                Text("Action")
            }
            Button(action: {
                anotherAction()
            }) {
                Text("Another action")
            }
        }
    }
}

struct MenuCommands: Commands {
    @Binding var toggleSetting: Bool

    var body: some Commands {
        CommandMenu("Custom Menu") {
            Button(action: {
                print("Menu Button selected")
            }, label: {
                Text("Menu Button")
            })

            Divider()

            Toggle(isOn: $toggleSetting, label: {
                Text("Toggle")
            })
        }
    }
}

@main
struct DemoApp: App {
    @State private var toggleSetting = true
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(replacing: CommandGroupPlacement.appVisibility) {
                EmptyView()
            }
            CommandGroup(replacing: CommandGroupPlacement.systemServices) {
                EmptyView()
            }
            CommandGroup(replacing: CommandGroupPlacement.pasteboard) {
                EmptyView()
            }
            CommandGroup(replacing: CommandGroupPlacement.windowSize) {
                EmptyView()
            }
            CommandGroup(replacing: CommandGroupPlacement.sidebar) {
                Button(action: {
                    print("Sidebar Help!")
                }) {
                    Text("Sidebar Help")
                }
                .keyboardShortcut("b", modifiers: .control)
            }
//            ToolbarCommands()
//            CommandGroup(replacing: ToolbarCommands) {
////                EmptyView()
//            }
//            ToolbarCommands
//            CommandMenu("View") {
//                Button(action: {}) {
//                    Text("MyApp Help")
//                }
//            }
////            CommandGroup(replacing: .appInfo) {}
//            CommandGroup(replacing: .pasteboard) {}
//            CommandGroup(replacing: .systemServices) {}
//            CommandGroup(replacing: .appTermination) {}
////            CommandGroup(replacing: .textEditing) {}
//            CommandGroup(replacing: .textFormatting) {}
////            CommandGroupPlacement(replacing: .windowList) {}
////            CommandGroupPlacement(replacing: .windowSize) {}
//
//            CommandGroup(replacing: .undoRedo) {
////                Button(action: {
////
////                }) {
////                        Text("MyApp2 Help")
////                }
//            }
//
//            CommandMenu("Custom Menu") {
//                Button(action: {
//                    print("Menu Button selected")
//                }, label: {
//                    Text("Menu Button")
//                })
//
//                Divider()
//            }
            AppCommands()
            MenuCommands(toggleSetting: $toggleSetting)
        }
    }
}
