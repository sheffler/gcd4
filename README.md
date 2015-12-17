When I try this

    swift build

I get the following error message.

    Compiling Swift Module 'gcd4' (1 sources)
    /home/sheffler/swift/gcd4/Sources/main.swift:42:1: error: module 'CDispatch' has no member named 'dispatch_after'
    CDispatch.dispatch_after(time, queue, {
    ^~~~~~~~~ ~~~~~~~~~~~~~~
    <unknown>:0: error: build had 1 command failures
    swift-build: exit(1): ["/home/sheffler/src/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04/usr/bin/swift-build-tool", "-f", "/home/sheffler/swift/gcd4/.build/debug/gcd4.o/llbuild.yaml"]

The function `dispatch_after` is not included, because the *blocks* feature is not enabled while the module is processed.

If I manually construct the `swiftc` compile command, I can create an executable.

    swiftc -v -o gcd4 Sources/main.swift -I .build/debug -j8 -Onone -g -Xcc -fblocks -Xcc -F-module-map=Packages/CDispatch-1.0.0/module.modulemap -I Packages/CDispatch-1.0.0 -I /usr/local/include






