//
//  ContentView.swift
//  HorizontalWheelPicker
//
//  Created by Thach Nguyen Trong on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var config: WheelPicker.Config = .init(count: 30, steps: 10, spacing: 10, multiplier: 1, showsText: true)
    @State private var value: CGFloat = 0
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                HStack(alignment: .lastTextBaseline, spacing: 5) {
                    Text(verbatim: "\(value)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .fontWidth(.condensed)
                        .contentTransition(.numericText(value: value))
                        .animation(.snappy, value: value)
                    
                    Text("lbs")
                        .font(.title2)
                        .fontWeight(.light)
                        .fontWidth(.condensed)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                }
                .padding(.bottom, 30)
                WheelPicker(config: config, value: $value)
                    .frame(height: 60)
                Spacer()
                
            }
            .navigationTitle("Wheel Picker")
            .safeAreaInset(edge: .bottom) {
                Button("Update") {
                    withAnimation(.bouncy) {
                        value = 12
                    }
                }
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
