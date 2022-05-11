//
//  ContentView.swift
//  display_practice
//
//  Created by TeU on 2022/5/4.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .leading, endPoint: .trailing)
                        .mask(Image(systemName: "person.2.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                        )
                        .frame(width: 96.0, height: 96.0)

                    Text("Health Sharing")
                        .bold()
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                    VStack (alignment: .leading){
                        HStack{
                            Image(systemName: "checklist")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFit()
                                .frame(width: 60.0, height: 60.0)
                                .padding([.horizontal], 2)
                                .foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text("You're in Control")
                                    .bold()
                                    .padding([.bottom], 2)
                                Text("Keep friends and family up to date on how you're doing by securely sharing your Health data.")
                                    .foregroundColor(.gray)
                            }
                        }.padding(20)

                        HStack{
                            Image(systemName: "bell.badge.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFit()
                                .frame(width: 60.0, height: 60.0)
                                .padding([.horizontal], 2)
                                .foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text("Dashboard and Notifications")
                                    .bold()
                                    .padding([.bottom], 2)
                                Text("Data you share will appear in their Health app. They can also get notifications if there's an update.")
                                    .foregroundColor(.gray)
                            }
                        }.padding(20)

                        HStack{
                            Image(systemName: "lock.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFit()
                                .frame(width: 60.0, height: 60.0)
                                .padding([.horizontal], 2)
                                .foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text("Private and Secure")
                                    .bold()
                                    .padding([.bottom], 2)
                                Text("Only a summary of each topic is shared, not the details. The information is encrypted and you can stop sharing at any time.")
                                    .foregroundColor(.gray)
                            }
                        }.padding(20)
                    }.padding()

                    Button ("Share with someone") {}
                        .padding([.vertical], 8)
                        .padding([.horizontal], 20)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(25)
                }
            }
        }
        
        VStack {
            Image("tg_image_3070856850")
                .resizable()
                .scaledToFit()
            Text("News+")
                .bold()
                .font(.system(size: 32))
                .fontWeight(.black)
            Text("Great news!")
                .font(.system(size: 32))
                .fontWeight(.heavy)
            Text("Audio stories are here.")
                .font(.system(size: 32))
                .fontWeight(.bold)
                .foregroundColor(.pink)
            Text("Listen only in Apple News+")
                .font(.system(size: 30))
                .fontWeight(.bold)
            Button ("Get Started") {}
                .padding([.vertical], 12)
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.pink)
                .cornerRadius(10)
            Text("Plan auto-renews for $9.99/month until canceled")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.gray)
        }.padding()
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
