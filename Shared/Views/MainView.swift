//
//  MainView.swift
//  TherapyApp
//
//  Created by Aiur on 23.11.2020.
//

import SwiftUI

struct TestItem: Identifiable {
    let id = UUID()
    let name: String
    let desciption: String
    let frequency: Int
    let totalFrequency: Int
    let duration: Int // of days
    let amount: Int // how much in one in of frequency
    let how: String
    let howTime: Int? // prefer minutes
    let binding: Binding<Bool> = Binding<Bool>.constant(false)
    let log: [Date]
    
    var nearestDate: String {
        get {
            if let date = log.sorted().first {//.first(where: { $0.timeIntervalSinceNow > 0 }) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "HH:mm"
                return dateFormatter.string(from: date)
            } else {
                return "Нет лога"
            }
        }
    }
}

struct MainView: View {
    
    var items = [TestItem(name: "Азитромицин", desciption: "Пить с молоком", frequency: 5, totalFrequency: 7, duration: 10, amount: 1, how: "До еды", howTime: 30, log: [Date(), Date(), Date(), Date(), Date()]),
                 TestItem(name: "Ромашка", desciption: "Заварить и пить", frequency: 4, totalFrequency: 5, duration: 10, amount: 1, how: "После еды", howTime: 15, log: [Date(), Date(), Date(), Date()]),
                 TestItem(name: "Лизобакт", desciption: "Рассасывать", frequency: 3, totalFrequency: 6, duration: 10, amount: 1, how: "До еды", howTime: 60, log: [Date(), Date(), Date()]),
                 TestItem(name: "Мирамистин", desciption: "Прыскать на гланды", frequency: 2, totalFrequency: 4, duration: 10, amount: 2, how: "До еды", howTime: nil, log: [Date(), Date()])]
    
    var body: some View {
        MyNavigationView(navigationTitle: "My Therapy") {
            List {
                ForEach(items) { (item: TestItem) in
                    DisclosureGroup(
                        isExpanded: item.binding,
                        content: {
                            VStack(alignment: .leading) {
                                Text(item.desciption)
                                HStack {
                                    Text(item.how)
                                    Spacer()
                                    Text(String(item.howTime ?? 0))
                                }
                                Divider()
                                Text("Log")
                                List {
                                    ForEach(item.log, id: \.self) { (date: Date) in
                                        RoundedRectangle(cornerRadius: 5.0).fill(Color.white).shadow(color: .black, radius: 5, x: 0, y: 0)
//                                            .overlay(Text(date.format(of: "HH:mm")))
                                    }
                                }
                            }
                        },
                        label: {
                            HStack {
                                Text(item.name)
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        ZStack(alignment: .leading) {
                                            RoundedRectangle(cornerRadius: 5.0).fill(Color.gray).frame(width: 100)
                                            RoundedRectangle(cornerRadius: 5.0).fill(Color.blue).frame(width: calculateWidth(of: item.frequency, total: item.totalFrequency))
                                                .overlay(
                                                    Text(String(item.frequency)).foregroundColor(.white)
                                                )
                                        }
                                        Text("of \(String(item.totalFrequency))")
                                    }
                                    Text("last using \(item.nearestDate)")
                                }
                                
                            }
                        })
                }
            }
        }
    }
    
    
    
    private func calculateWidth(of curency: Int, total totalCurency: Int) -> CGFloat {
        let perOne: CGFloat = 100.0 / CGFloat(totalCurency)
        return perOne * CGFloat(curency)
    }
}

struct MyNavigationView<Content: View>: View {
    let content: () -> Content
    let navigationTitle: String
    
    var body: some View {
        #if os(iOS)
            NavigationView {
                content()
                    .navigationTitle(navigationTitle)
            }
        #else
            content()
        #endif
    }
    
    init(navigationTitle: String = "", @ViewBuilder content: @escaping () -> Content) {
        self.navigationTitle = navigationTitle
        self.content = content
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
