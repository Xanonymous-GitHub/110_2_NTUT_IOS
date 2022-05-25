//
//  ContentView.swift
//  profile
//
//  Created by TeU on 2022/5/25.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        TabView {
            GraceView()
                .tabItem{Label("GraceView", systemImage: "music.house.fill")}
            AppleView()
                .tabItem{
                    Label("AppleView", systemImage: "hammer")
                }
        }
    }
}

struct GraceView: View {
    @State private var tapCount = 0
    var body: some View {
        NavigationView {
            VStack {
                Image("cat")
                    .resizable()
                    .padding()
                    .scaledToFit()
                Text("My Teacher")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .bold()
                Button ("Tap Count: \(tapCount)") {
                    self.tapCount += 1
                }
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .cornerRadius(10.0)
                .shadow(radius: 20)
            }
            .padding()
            .navigationTitle("Grace")
        }
    }
}


struct AppleView: View {
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate, vanilla, strawberry
        var id: Self { self }
    }
    
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var date = Date()
    @State private var speed = 50.0
    @State private var isEditing = false
    
    
    enum Field: Hashable {
        case username
        case password
    }
    
    @State private var username = ""
    @State private var password = ""
    @State private var vibrateOnRing = false
    @State private var showingAlert = false
    @FocusState private var focusedField: Field?
    
    @State private var value = 0
    let colors: [Color] = [
        .orange,
        .red,
        .gray,
        .blue,
        .green,
        .purple,
        .pink,
    ]
    
    func incrementStep() {
        value += 1
        if value >= colors.count { value = 0 }
    }
    
    func decrementStep() {
        value -= 1
        if value < 0 { value = colors.count - 1 }
    }
    
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(
            year: 2021,
            month: 1,
            day: 1
        )
        let endComponents = DateComponents(
            year: 2021,
            month: 12,
            day: 31,
            hour: 23,
            minute: 59,
            second: 59
        )
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    func handleLogin(_ username: String, _ password: String) {
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker(
                    "Start Date",
                    selection: $date,
                    in: dateRange,
                    displayedComponents: [
                        .date,
                        .hourAndMinute,
                    ]
                )
                .padding()
                Picker("Flavor", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
                .scaledToFit()
                VStack {
                    Slider(
                        value: $speed,
                        in: 0...100,
                        onEditingChanged: { editing in
                            isEditing = editing
                        }
                    )
                    Text("\(speed)")
                        .foregroundColor(isEditing ? .red : .blue)
                }
                Toggle(isOn: $vibrateOnRing) {
                    Text("Vibrate on Ring")
                }
                Stepper {
                    Text("Value: \(value) Color: \(colors[value].description)")
                } onIncrement: {
                    incrementStep()
                } onDecrement: {
                    decrementStep()
                }
                .padding(5)
                .background(colors[value])
                Button("show Alert") {
                    showingAlert = true
                }
                .alert("Important message", isPresented: $showingAlert) {
                    Button("First") { }
                    Button("Second") { }
                    Button("Third") { }
                }
                Form {
                    TextField("Username", text: $username)
                        .focused($focusedField, equals: .username)
                    
                    SecureField("Password", text: $password)
                        .focused($focusedField, equals: .password)
                    
                    Button("Sign In") {
                        if username.isEmpty {
                            focusedField = .username
                        } else if password.isEmpty {
                            focusedField = .password
                        } else {
                            handleLogin(username, password)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Apple")
        }
    }
}
