//
//  BotResponse.swift
//  ChatBotTutorial
//
//  Created by 김미향 on 2022/03/27.
//

import Foundation

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") {
        return "안녕!"
    } else if tempMessage.contains("Goodbye") {
        return "나중에 얘기하자!"
    } else if tempMessage.contains("How are you?") {
        return "I'm fine, how are you?"
    } else if tempMessage.contains("잘 지내니") {
        return "잘 지내고 있지ㅋㅋㅋㅋ"
    } else if tempMessage.contains("안녕") {
        return "안녕"
    } else if tempMessage.contains("힘들어") {
        return "힘들구나. 구체적으로 말해줄 수 있어?"
    } else {
        return "그렇구나."
    }
    
}
