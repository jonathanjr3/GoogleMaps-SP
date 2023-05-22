// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Use these linker settings for the respective binary target properties below once support is added
// Issue link: https://github.com/apple/swift-package-manager/issues/5618
let googleMapsLinkerSettings: [LinkerSetting] = [
    .linkedLibrary("z"),
    .linkedLibrary("c++"),
    .linkedFramework("CoreData"),
    .linkedFramework("CoreFoundation"),
    .linkedFramework("CoreGraphics"),
    .linkedFramework("CoreImage"),
    .linkedFramework("CoreLocation"),
    .linkedFramework("CoreTelephony"),
    .linkedFramework("CoreText"),
    .linkedFramework("Foundation"),
    .linkedFramework("GLKit"),
    .linkedFramework("ImageIO"),
    .linkedFramework("Metal"),
    .linkedFramework("OpenGLES"),
    .linkedFramework("QuartzCore"),
    .linkedFramework("SystemConfiguration"),
    .linkedFramework("UIKit")
]

let googleMapsCore_M4BLinkerSettings: [LinkerSetting] = [
    .linkedLibrary("z"),
    .linkedLibrary("c++"),
    .linkedFramework("CoreData"),
    .linkedFramework("CoreFoundation"),
    .linkedFramework("CoreGraphics"),
    .linkedFramework("CoreImage"),
    .linkedFramework("CoreLocation"),
    .linkedFramework("CoreTelephony"),
    .linkedFramework("CoreText"),
    .linkedFramework("Foundation"),
    .linkedFramework("GLKit"),
    .linkedFramework("ImageIO"),
    .linkedFramework("Metal"),
    .linkedFramework("OpenGLES"),
    .linkedFramework("QuartzCore"),
    .linkedFramework("Security"),
    .linkedFramework("SystemConfiguration"),
    .linkedFramework("UIKit")
]

let googleMapsBaseLinkerSettings: [LinkerSetting] = [
    .linkedLibrary("z"),
    .linkedFramework("CoreFoundation"),
    .linkedFramework("CoreGraphics"),
    .linkedFramework("CoreLocation"),
    .linkedFramework("CoreTelephony"),
    .linkedFramework("CoreText"),
    .linkedFramework("Foundation"),
    .linkedFramework("QuartzCore"),
    .linkedFramework("Security"),
    .linkedFramework("UIKit"),
]

let googlePlacesLinkerSettings: [LinkerSetting] = [
    .linkedLibrary("z"),
    .linkedFramework("CoreFoundation"),
    .linkedFramework("CoreLocation"),
    .linkedFramework("Foundation"),
    .linkedFramework("QuartzCore"),
    .linkedFramework("Security"),
    .linkedFramework("UIKit")
]

let googleMapsBinaryTarget = Target.binaryTarget(name: "GoogleMaps", path: "Sources/Frameworks/GoogleMaps.xcframework")
//googleMapsBinaryTarget.linkerSettings = googleMapsLinkerSettings

let googlePlacesBinaryTarget = Target.binaryTarget(name: "GooglePlaces", path: "Sources/Frameworks/GooglePlaces.xcframework")
//googlePlacesBinaryTarget.linkerSettings = googlePlacesLinkerSettings

let googleMapsCoreBinaryTarget = Target.binaryTarget(name: "GoogleMapsCore", path: "Sources/Frameworks/GoogleMapsCore.xcframework")
//googleMapsCoreBinaryTarget.linkerSettings = googleMapsCore_M4BLinkerSettings

let googleMapsBaseBinaryTarget = Target.binaryTarget(name: "GoogleMapsBase", path: "Sources/Frameworks/GoogleMapsBase.xcframework")
//googleMapsBaseBinaryTarget.linkerSettings = googleMapsBaseLinkerSettings

let googleMapsM4BBinaryTarget = Target.binaryTarget(name: "GoogleMapsM4B", path: "Sources/Frameworks/GoogleMapsM4B.xcframework")
//googleMapsM4BBinaryTarget.linkerSettings = googleMapsCore_M4BLinkerSettings

let package = Package(
    name: "GoogleMaps-SP",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "GoogleMapsBase",
            targets: [
                "GoogleMapsBase"
            ]
        ),
        .library(
            name: "GoogleMapsCore",
            targets: [
                "GoogleMapsCore"
            ]
        ),
        .library(
            name: "GoogleMaps",
            targets: [
                "GoogleMaps",
                "GoogleMapsBase",
                "GoogleMapsCore"
            ]
        ),
        .library(
            name: "GoogleMapsM4B",
            targets: [
                "GoogleMapsM4B",
                "GoogleMapsBase"
            ]
        ),
        .library(
            name: "GooglePlaces",
            targets: [
                "GooglePlaces",
                "GoogleMapsBase"
            ]
        )
    ],
    targets: [
        googleMapsBinaryTarget,
        googleMapsBaseBinaryTarget,
        googleMapsCoreBinaryTarget,
        googleMapsM4BBinaryTarget,
        googlePlacesBinaryTarget
    ]
)
