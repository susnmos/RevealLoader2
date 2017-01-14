#line 1 "/Users/susnm/Desktop/Reveal/Reveal/Reveal.xm"








#include <dlfcn.h>
static __attribute__((constructor)) void _logosLocalCtor_03738126(int __unused argc, char __unused **argv, char __unused **envp) {
NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
NSDictionary *prefs = [[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.susnm.Reveal.plist"] retain];
NSString *libraryPath = @"/Library/RHRevealLoader/libReveal.dylib";

if([[prefs objectForKey:[NSString stringWithFormat:@"RHRevealEnabled-%@", [[NSBundle mainBundle] bundleIdentifier]]] boolValue]) {
if ([[NSFileManager defaultManager] fileExistsAtPath:libraryPath]){
dlopen([libraryPath UTF8String], RTLD_NOW);
[[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStart" object:nil];
NSLog(@"RHRevealLoader loaded %@", libraryPath);
}
}

[pool drain];
}
