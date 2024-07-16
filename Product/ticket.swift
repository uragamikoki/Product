//
//  ticket.swift
//  sample
//
//  Created by Owner on 2024/07/11.
//

import Foundation

struct TicketData: Identifiable{
    let id = UUID()
    let name: String
    let eventDate: Date
    let overview: String
}
var ticketArray = [
    TicketData(name: "first", eventDate: createdate(year: 2000,month: 4,day: 10) ?? Date(), overview: "ひとつ目のチケット"),
    TicketData(name: "second", eventDate: createdate(year: 2024,month: 4,day: 10) ?? Date(), overview: "ふたつ目のチケット"),
    TicketData(name: "therd", eventDate: createdate(year: 2024,month: 7,day: 10) ?? Date(), overview: "みっつ目のチケット"),
    TicketData(name: "forth", eventDate: createdate(year: 2024,month: 7,day: 20) ?? Date(), overview: "よっつ目のチケット")
    ]

func createdate(year:Int, month:Int, day:Int) -> Date?{
    let cal =  Calendar(identifier: .gregorian)
    let date = cal.date(from: DateComponents(
        year: year,
        month: month,
        day: day
    ))
    return date
}
