//
//  ContentView.swift
//  ChatBotTutorial
//
//  Created by 김미향 on 2022/03/27.
//

import SwiftUI

// 아무런 응답 없는 것도 고려해야 함.

struct ContentView: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Eliza ChatBot입니다😃"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Eliza ChatBot")
                    .font(.largeTitle)
                    .bold()
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color.blue)
            }
            ScrollView {
                // Messages
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let _ = print(message)
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        let _ = print(newMessage)
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack {
                            Text(message)
                                .padding()
                                .background(.white.opacity(1.0))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                    //Text(message)
                }.rotationEffect(.degrees(180))
                
            }.rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.10))
            HStack {
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                Button {
                    // SendMessage
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
            }
            .padding()
        }
    }
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            withAnimation {
                messages.append(getBotResponse(message: message))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
