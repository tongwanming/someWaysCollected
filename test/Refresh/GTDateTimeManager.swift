//
//  GTDateTimeManager.swift
//  gtOilMerchant
//
//  Created by gt001 on 2020/5/26.
//  Copyright © 2020 tiangui. All rights reserved.
//

import UIKit

class GTDateTimeManager {
    
    private static let instence : GTDateTimeManager = {
        let v = GTDateTimeManager()
        return v
    }()
    class func shared() -> GTDateTimeManager {
        return instence
    }
    private init() {}
    
    //日期 -> 字符串
    func date2String(_ date:Date, dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
//        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.timeZone = TimeZone.init(abbreviation: "UTC")
        formatter.dateFormat = dateFormat
        
        let date = formatter.string(from: date)
        return date
    }
    
    //字符串 -> 日期
    func string2Date(_ string:String, dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
//        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.timeZone = TimeZone.init(abbreviation: "UTC")
        formatter.dateFormat = dateFormat
        
        let date = formatter.date(from: string)
        return date
    }
    
    //时间戳转成字符串
    func timeIntervalChangeToTimeStr(timeInterval:Double, _ dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let date:NSDate = NSDate.init(timeIntervalSince1970: timeInterval)
        let formatter = DateFormatter.init()
        formatter.dateFormat = dateFormat
        formatter.timeZone = TimeZone.init(abbreviation: "UTC")
        return formatter.string(from: date as Date)
    }
    
    //时间精度处理
    func timeChangeWithDateFormat(timeStr: String, dateFormat:String = "yyyy-MM-dd HH:mm") -> String {
        if let d: Date = GTDateTimeManager.shared().string2Date(timeStr, dateFormat: "yyyy-MM-dd HH:mm:ss") {
            return GTDateTimeManager.shared().date2String(d, dateFormat: dateFormat)
        }
        return ""
    }
    
    // 字符串转时间戳
    func timeStrChangeTotimeInterval(timeStr: String, dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> TimeInterval {
        
        let format = DateFormatter.init()
        format.dateStyle = .medium
        format.timeStyle = .short
        format.timeZone = TimeZone.init(abbreviation: "UTC")
        format.dateFormat = dateFormat
        let date = format.date(from: timeStr)
        if let ndate = date {
            debugPrint("..........\(String(ndate.timeIntervalSince1970))")
            return ndate.timeIntervalSince1970
        } else {
            return 0.0
        }
        
    }
    
    func compareTheTwoDate(startDate:Date, endDate:Date) -> Bool {
       
        let calendar = Calendar.current
        let unit:Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let commponentTemp:DateComponents = calendar.dateComponents(unit, from: startDate, to: endDate)
        
        guard commponentTemp.year! > 0 || commponentTemp.month! > 0 || commponentTemp.day! > 0 || commponentTemp.hour! > 0 || commponentTemp.minute! > 0 || commponentTemp.second! > 0  else {
            return false   //表示结束时间大
        }
        return true   //表示结束时间小
    }
    
    func compareTimeOfSize(startDate:Date, endDate:Date? = nil) -> Bool {
        //当前时间
        let nowDate = Date()
        let calendar = Calendar.current
        let unit:Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        
        //开始时间不能小于当前时间
        let commponentTemp:DateComponents = calendar.dateComponents(unit, from: startDate, to: nowDate)
        //let days = commponentTemp.day, days > 0, let hours = commponentTemp.hour, hours > 0
        guard commponentTemp.year! > 0 || commponentTemp.month! > 0 || commponentTemp.day! > 0 || commponentTemp.hour! > 0 || commponentTemp.minute! > 0 || commponentTemp.second! > 0  else {
            return false
        }
        
        //结束时间是不是为空
        if let eDate = endDate {
            let commponentEnd:DateComponents = calendar.dateComponents(unit, from: nowDate, to:eDate)
            guard commponentEnd.year! > 0 || commponentEnd.month! > 0 || commponentEnd.day! > 0 || commponentEnd.hour! > 0 || commponentEnd.minute! > 0 || commponentEnd.second! > 0  else {
                return false
            }
        }
        
        return true
    }

}

extension Date {
   
    
    //当前时间
    var date:Date {
       
        let dateStr = GTDateTimeManager.shared().date2String(Date())
        if let date = GTDateTimeManager.shared().string2Date(dateStr) {
            return date
        } else {
            return Date()
        }
        
//        let timezone = TimeZone.init(abbreviation: "UTC")
//        if let internaValue = timezone?.secondsFromGMT(for: date) {
//            let vdate = date.addingTimeInterval(TimeInterval.init(internaValue))
//            return vdate
//        } else {
//            return self
//        }
        
    }
    /// 获取当前 秒级 时间戳 - 10位
    var timeStamp : TimeInterval {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
//        let timeStamp = Int(timeInterval)
        return timeInterval
    }

    
    /// 获取当前 毫秒级 时间戳 - 13位
    var milliStamp : Int64 {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return millisecond
    }
}
