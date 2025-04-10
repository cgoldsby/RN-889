## Summary:

iOS crashes in the **New Architecture** because Codegen includes all installed packages — even ones that don’t support iOS. The **Legacy Architecture** uses a different code generator that doesn’t have this issue. In both architectures, CocoaPods correctly excludes platform-specific native code — but Codegen doesn’t respect those exclusions in the New Architecture.

To prevent this, a macro was originally introduced to guard Objective-C code in generated components:
→ facebook/react-native#42047

However, that macro usage was inadvertently lost during a later refactor that moved the Codegen provider to a static template:
→ facebook/react-native#47518

This PR restores those platform guard macros in `RCTThirdPartyComponentsProvider`, ensuring that unsupported packages do not cause runtime crashes on iOS:

```diff
		@"RNSVGTextPath": NSClassFromString(@"RNSVGTextPath"), // react-native-svg
+ #if !TARGET_OS_IOS && !TARGET_OS_TV && !TARGET_OS_VISION
		@"MacOSClass": NSClassFromString(@"MacOSClass"), // test-library-macos
+ #endif
+ #if !TARGET_OS_IOS && !TARGET_OS_OSX && !TARGET_OS_VISION
		@"TvOSClass": NSClassFromString(@"TvOSClass"), // test-library-tvos
+ #endif
#if !TARGET_OS_IOS && !TARGET_OS_OSX && !TARGET_OS_TV
		@"VisionOSClass": NSClassFromString(@"VisionOSClass"), // test-library-visionos
+ #endif
+ #if !TARGET_OS_TV
		@"RNCWebView": NSClassFromString(@"RNCWebView"), // react-native-webview
+ #endif
    };
  });

  return thirdPartyComponents;
}
```

This issue was initially reported in [react-native-tvos#889](https://github.com/react-native-tvos/react-native-tvos/issues/889), where a developer's iOS app crashed after including a tvOS-only package. CocoaPods correctly excluded the code, but Codegen still attempted to register the component at runtime.

## Changelog:

[iOS] [Fixed] - Reintroduce platform guard macros in RCTThirdPartyComponentsProvider to prevent crashes when including platform-specific packages in OOT apps.

## Test Plan:
[MyApp](https://github.com/cgoldsby/RN-889) contains several React Native packages that do not support iOS. When running on an iOS device, the app crashes.

### Reproduce the steps for crash:

```shell
gh repo clone cgoldsby/RN-889
yarn
yarn ios -i
```

❌ MyApp launches and crashes immediately.

### Apply patch to fix:

```shell
git apply patches/*
yarn ios -i
```

✅ MyApp launches and does not crash.

## Related Issues:

facebook/react-native#42047 (Macro introduced)

facebook/react-native#47518 (Regression)

react-native-tvos/react-native-tvos#889 (Original crash report)

https://github.com/cgoldsby/RNTV-889 (RVTV example)
