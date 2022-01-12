//
//  ContentView.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 17/12/21.
//

import SwiftUI
import CoreData
import ComposableArchitecture

struct MenuView: View {
    let store: Store<MenuDomainState, MenuDomainAction>
    
    @Environment(\.managedObjectContext) private var viewContext
    
    private var menuItems: [MenuItem] = Menu.menuItems
    
    // State to start/stop the alert dialog
    @State private var showAddTodoView = false;
    
    
    var body: some View {
        WithViewStore(self.store) {
            viewStore in
            
        }
        List {
            Text("Menu")
            Section(header: Text("Actions")) {
                ForEach(menuItems[0...5]) { item in
                    NavigationLink {
                        Text("Item at \(item.label)")
                    } label: {
                        MenuRowView(label: item.label, icon: item.icon)
                    }.listRowSeparator(.hidden)
                }
            }
            
            Section(header: Text("Programs & Presets")) {
                ForEach(menuItems[6...8]) { item in
                    NavigationLink {
                        if item.label == "Custom Foods" {
                            FoodsListView()
                        } else {
                            Text("Item at \(item.label)")
                        }
                    } label: {
                        MenuRowView(label: item.label, icon: item.icon)
                    }
                }
            }
            
            Section(header: Text("Settings")) {
                ForEach(menuItems[9...]) { item in
                    NavigationLink {
                        Text("Item at \(item.label)")
                    } label: {
                        MenuRowView(label: item.label, icon: item.icon)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        
        }.padding(-18)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        MenuView(
            store: Store(initialState: MenuDomainState(),
                              reducer: MenuDomainReducer,
                             environment:  MenuDomainEnvironment()
                        )
                )
    }
}
