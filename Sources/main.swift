//
// Tom Sheffler
// Dec 2015
//

import Foundation
import CDispatch

#if os(Linux)
import Glibc
#else
import Darwin
#endif


print("Hello World!")

var someInts = [Int]()

print("someInts is of type [Int] with \(someInts.count) items.")

someInts = [1,2,3]

print("someInts is \(someInts) with \(someInts.count) items.")

let now = UInt64(CDispatch.DISPATCH_TIME_NOW)

print ("Now:\(now)")

// print ("Dispatch:\(dispatch_get_main_queue())")

let time = CDispatch.dispatch_time(now, Int64(2.0 * Double(CDispatch.NSEC_PER_SEC)))

print ("Time:\(time)")

// let queue = dispatch_get_main_queue()
// let queue = dispatch_get_current_queue()
let queue = dispatch_queue_create("com.example", nil)

print("Main:\(queue)")

CDispatch.dispatch_after(time, queue, {
    print("Delayed!")
})

Glibc.sleep(5)
