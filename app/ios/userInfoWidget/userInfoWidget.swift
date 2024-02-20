//
//  userInfoWidget.swift
//  userInfoWidget
//
//  Created by 손형준 on 2/20/24.
//

import WidgetKit
import SwiftUI

struct UserInfoEntry: TimelineEntry {
    let date: Date
    let positiveDeltaCO2Radio: Double?
    let negativeDeltaCO2Radio: Double?
    let characterAsset: String?
    let displaySize: CGSize
}

struct userInfoWidgetEntryView : View {
    var entry: Provider.Entry
    
    init(entry: Provider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        if entry.characterAsset == nil {
            Text("정상적인 작동을 위해서는 최소 1회 실행이 필요합니다!")
                .multilineTextAlignment(.center)
                .containerBackground(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255), for: .widget)
        } else {
            VStack {
                HStack {
                    if entry.negativeDeltaCO2Radio! == 0 && entry.positiveDeltaCO2Radio! == 0 {
                        AnyView(
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .fill(.gray)
                                .frame(width: entry.displaySize.width - 16, height: 12)
                                .fixedSize(horizontal: false, vertical: true)
                        )
                    } else {
                        negationBarView
                        sizeGapView
                        positiveBarView
                    }
                }
                HStack {
                    negationTextView
                    Spacer()
                    positiveTextView
                }
                Spacer()
                characterView
            }
            .containerBackground(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255), for: .widget)
        }
    }
    
    var negationBarView: some View {
        let width: Double
        
        if entry.negativeDeltaCO2Radio! != 0 && entry.positiveDeltaCO2Radio! != 0 {
            width = (entry.displaySize.width - 16.0) * entry.negativeDeltaCO2Radio!
        } else {
            width = entry.displaySize.width - 16.0
        }
        
        if entry.negativeDeltaCO2Radio! != 0 {
            return AnyView(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(Color(red: 242 / 255, green: 171 / 255, blue: 171 / 255))
                    .frame(width: width, height: 12)
                    .fixedSize(horizontal: false, vertical: true)
            )
        } else {
            return AnyView(EmptyView())
        }
    }
    
    var positiveBarView: some View {
        let width: Double
        
        if entry.negativeDeltaCO2Radio! != 0 && entry.positiveDeltaCO2Radio! != 0 {
            width = (entry.displaySize.width - 16.0) * entry.positiveDeltaCO2Radio!
        } else {
            width = entry.displaySize.width - 16.0
        }
        
        if entry.positiveDeltaCO2Radio! != 0 {
            return AnyView(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(Color(red: 144 / 255, green: 205 / 255, blue: 190 / 255))
                    .frame(width: width, height: 12)
                    .fixedSize(horizontal: false, vertical: true)
            )
        } else {
            return AnyView(EmptyView())
        }
    }
    
    var sizeGapView: some View {
        if entry.negativeDeltaCO2Radio! != 0 && entry.positiveDeltaCO2Radio! != 0 {
            return AnyView(Spacer(minLength: 4))
        } else {
            return AnyView(EmptyView())
        }
    }
    
    var negationTextView: some View {
        if (entry.negativeDeltaCO2Radio! == 0) {
            return Text(String(format: "%.4f", entry.negativeDeltaCO2Radio!))
                .font(.system(size: 12))
                .foregroundColor(.gray)
        } else {
            return Text(String(format: "↑ %.4f", entry.negativeDeltaCO2Radio!))
                .font(.system(size: 12))
                .foregroundColor(Color(red: 242 / 255, green: 171 / 255, blue: 171 / 255))
        }
    }
    
    var positiveTextView: some View {
        if (entry.positiveDeltaCO2Radio! == 0) {
            return Text(String(format: "%.4f", entry.positiveDeltaCO2Radio!))
                .font(.system(size: 12))
                .foregroundColor(.gray)
        } else {
            return Text(String(format: "↓ %.4f", entry.positiveDeltaCO2Radio!))
                .font(.system(size: 12))
                .foregroundColor(Color(red: 144 / 255, green: 205 / 255, blue: 190 / 255))
        }
    }

    var characterView: some View {
        if let uiImage = UIImage(named: entry.characterAsset!) {
            let image = Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            return AnyView(image)
        } else {
            return AnyView(
                Text("The image file could not be loaded")
            )
        }
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> UserInfoEntry {
        UserInfoEntry(
            date: Date(),
            positiveDeltaCO2Radio: 10,
            negativeDeltaCO2Radio: 5,
            characterAsset: "1_1_1_1",
            displaySize: context.displaySize
        )
    }
    
    func getSnapshot(in context: Context, completion: @escaping (UserInfoEntry) -> Void) {
        let entry: UserInfoEntry
        
        if context.isPreview {
            entry = placeholder(in: context)
        } else {
            let userDefaults = UserDefaults(suiteName: "group.earthAndI.userInfoWidget")
            let characterAsset = userDefaults!.string(forKey: "character_asset")
            let positiveDeltaCO2 = userDefaults!.double(forKey: "positive_delta_CO2")
            let negativeDeltaCO2 = userDefaults!.double(forKey: "negative_delta_CO2")
            
            let positiveDeltaCO2Radio: Double
            let negativeDeltaCO2Radio: Double
            
            if positiveDeltaCO2 + negativeDeltaCO2 == 0 {
                positiveDeltaCO2Radio = 0.0
                negativeDeltaCO2Radio = 0.0
            } else {
                positiveDeltaCO2Radio = Double(positiveDeltaCO2) / (Double(positiveDeltaCO2) + Double(negativeDeltaCO2))
                negativeDeltaCO2Radio = Double(negativeDeltaCO2) / (Double(positiveDeltaCO2) + Double(negativeDeltaCO2))
            }
            
            entry = UserInfoEntry(
                date: Date(),
                positiveDeltaCO2Radio: positiveDeltaCO2Radio,
                negativeDeltaCO2Radio: negativeDeltaCO2Radio,
                characterAsset: characterAsset,
                displaySize: context.displaySize
            )
        }
        
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<UserInfoEntry>) -> Void) {
        getSnapshot(in: context) { (entry) in
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
    }
}

struct userInfoWidget: Widget {
    let kind: String = "userInfoWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) {
            entry in userInfoWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("E&I")
        .description("This is E&I Widget")
        .supportedFamilies([.systemSmall])
    }
}
