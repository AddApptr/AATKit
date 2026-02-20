// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AATKit",
    platforms: [.iOS(.v13)],
    products: [

        .library(name: "AATKit-Core", targets: ["AATKit-Core"]),
        .library(name: "AATKit-AATAdMobMediationAdapter", targets: ["AATKit-AATAdMobMediationAdapter"]),
        .library(name: "AATKit-AATAdMobDSPAdapter", targets: ["AATKit-AATAdMobDSPAdapter"]),
        .library(name: "AATKit-GooglePartnerBidding", targets: ["AATKit-GooglePartnerBidding"]),

        // Dependencies
        .library(name: "AATKit-GoogleMobileAds", targets: ["AATKit-GoogleMobileAds"]),
        .library(name: "AATKit-AppLovin", targets: ["AATKit-AppLovin"]),
        .library(name: "AATKit-AppNexus", targets: ["AATKit-AppNexus"]),
        .library(name: "AATKit-AppHarbr", targets: ["AATKit-AppHarbr"]),
        .library(name: "AATKit-Amazon", targets: ["AATKit-Amazon"]),
        .library(name: "AATKit-FeedAd", targets: ["AATKit-FeedAd"]),
        .library(name: "AATKit-GraviteRTB", targets: ["AATKit-GraviteRTB"]),
        .library(name: "AATKit-SmartAd", targets: ["AATKit-SmartAd"]),
        .library(name: "AATKit-Moloco", targets: ["AATKit-Moloco"]),
        .library(name: "AATKit-YOC", targets: ["AATKit-YOC"]),
        .library(name: "AATKit-InMobi", targets: ["AATKit-InMobi"]),
        .library(name: "AATKit-IronSource", targets: ["AATKit-IronSource"]),
        .library(name: "AATKit-Kidoz", targets: ["AATKit-Kidoz"]),
        .library(name: "AATKit-PubNative", targets: ["AATKit-PubNative"]),
        .library(name: "AATKit-Prebid", targets: ["AATKit-Prebid"]),
        .library(name: "AATKit-Tappx", targets: ["AATKit-Tappx"]),
        .library(name: "AATKit-Teads", targets: ["AATKit-Teads"]),
        .library(name: "AATKit-Unity", targets: ["AATKit-Unity"]),
        .library(name: "AATKit-Vungle", targets: ["AATKit-Vungle"]),
        .library(name: "AATKit-OguryAds", targets: ["AATKit-OgurySdk"]),
        .library(name: "AATKit-Mintegral", targets: ["AATKit-Mintegral"]),
        .library(name: "AATKit-Facebook", targets: ["AATKit-Facebook"]),
        .library(name: "AATKit-DisplayIO", targets: ["AATKit-DisplayIO"]),
        .library(name: "AATKit-UTIQ", targets: ["AATKit-UTIQ"]),
        .library(name: "AATAppNexusAdapter", targets: ["AATAppNexusAdapter"]),
        .library(name: "AATAmazonAdapter", targets: ["AATAmazonAdapter"]),
        .library(name: "AATKit-AATMetaBiddingAdapter", targets: ["AATKit-AATMetaBiddingAdapter"]),

        // CMPs
        .library(name: "AATKit-GoogleCMP", targets: ["AATKit-GoogleCMP"]),
        .library(name: "AATKit-SourcePointCMP", targets: ["AATKit-SourcePointCMP"]),
        .library(name: "AATKit-AppConsentCMP", targets: ["AATKit-AppConsentCMP"]),

        // Default Dependencies
        .library(name: "AATKit-Default", targets: ["AATKit-GoogleMobileAds",
                                                   "AATKit-AppLovin",
                                                   "AATKit-GraviteRTB",
                                                   "AATKit-SmartAd",
                                                   "AATKit-YOC",
                                                   "AATKit-InMobi",
                                                   "AATKit-IronSource",
                                                   "AATKit-OgurySdk",
                                                   "AATKit-PubNative",
                                                   "AATKit-Unity",
                                                   "AATKit-Vungle",
                                                   "AATKit-Mintegral",
                                                   "AATKit-GooglePartnerBidding",
                                                   "AATKit-Tappx",
                                                   "AATKit-Facebook",
                                                   "AATKit-AppNexus",
                                                   "AATKit-Prebid",
                                                   "AATKit-AATMetaBiddingAdapter",
                                                   "AATKit-Moloco"
                                                  ]),

    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", .upToNextMinor(from: "13.4.0")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .upToNextMinor(from: "12.13.0")),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", .upToNextMinor(from: "1.27.0")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSDK.git", .upToNextMinor(from: "1.9.1"))
        //        .package(name: "TeadsSDK", url: "https://github.com/teads/TeadsSDK-iOS", .exact("5.1.3")), Conflict in AppLovin dependency
    ],
    // Mark: Targets
    targets: [
        // AATKit target
        .target(name:"AATKit-Core",
                dependencies: ["AATKit"],
                path: "./Sources/AATKit"),

        // AATAdMobMediationAdapter target
        .target(name:"AATKit-AATAdMobMediationAdapter",
                dependencies: ["AATKit-GoogleMobileAds", "AATKit"],
                path: "./Sources/AATAdMobMediationAdapter"),

        // AATAdMobDSPAdapter
        .target(name:"AATKit-AATAdMobDSPAdapter",
                dependencies: [ "AATKit-GoogleMobileAds", "AATKit", "AATKit-GraviteRTB", "AATAdMobDSPAdapter"],
                path: "./Sources/AATAdMobDSPAdapter"),

        // GooglePartnerBidding
        .target(name:"AATKit-GooglePartnerBidding",
                dependencies: [
                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    "AATKit",
                    "AATKit-GraviteRTB",
                    "AATAdMobDSPAdapter"
                ],
                path: "./Sources/GooglePartnerBiddingSources"),

        // MARK - Dependencies Targets
        .target(name: "AATKit-GoogleMobileAds",
                dependencies: [
                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    "AATGoogleAdsAdapter",
                ],
                path: "./Sources/GoogleMobileAdsSources"),

            .target(name: "AATKit-AppLovin",
                    dependencies: [
                        .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                        "AATAppLovinAdapter"
                    ],
                    path: "./Sources/AppLovinSources"),

            .target(name:"AATKit-AppHarbr",
                    dependencies: [
                        .product(name: "AppHarbrSDK", package: "AppHarbrSDK"),
                        "AATAppHarbrAdapter"
                    ],
                    path: "./Sources/AppHarbr"),

            .target(name:"AATKit-AppNexus",
                    dependencies: ["AATAppNexusSDK", "AATAppNexusAdapter"],
                    path: "./Sources/AppNexusSources"),

            .target(name:"AATKit-Amazon",
                    dependencies: ["AATDTBiOSSDK", "AATAmazonAdapter"],
                    path: "./Sources/AmazonSources"),

            .target(name:"AATKit-FeedAd",
                    dependencies: ["AATFeedAd", "AATFeedAdAdapter"],
                    path: "./Sources/FeedAdSources"),

            .target(name:"AATKit-GraviteRTB",
                    dependencies: [
                        .product(name: "RTBSDK", package: "RTBSDK"),
                        "AATGraviteRTBAdapter"
                    ],
                    path: "./Sources/GraviteRTB"),

            .target(name:"AATKit-OgurySdk",
                    dependencies: ["AATOgurySdk", "AATOguryAds", "AATOguryCore", "AATOMSDK_Ogury", "AATOguryAdapter"],
                    path: "./Sources/OguryAdsSources"),

            .target(name:"AATKit-GoogleCMP",
                    dependencies: [
                        .product(name: "GoogleUserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
                        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                        "AATGoogleCMPAdapter"
                    ],
                    path: "./Sources/GoogleCMPSources"),


            .target(name:"AATKit-Facebook",
                    dependencies: [
                        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                        "AATFacebookAdapter",
                        "AATFBAudienceNetwork",
                        "AATMetaBiddingAdapter"
                    ],
                    path: "./Sources/FacebookSources"),
        // AATMetaBiddingAdapter
        .target(name: "AATKit-AATMetaBiddingAdapter",
                dependencies: [
                    "AATKit",
                    "AATKit-GraviteRTB",
                    "AATKit-Facebook",
                    "AATMetaBiddingAdapter"
                ], path: "./Sources/MetaBidingSources"),

            .target(name:"AATKit-Moloco",
                    dependencies: ["AATMolocoBiddingDSPAdapter", "AATMolocoSDK", "AATKit", "AATKit-GraviteRTB",],
                    path: "./Sources/MolocoSources"),

            .target(name:"AATKit-SmartAd",
                    dependencies: ["AATSASDisplayKit", "AATSmartAdAdapter"],
                    path: "./Sources/SmartAdSources"),

            .target(name:"AATKit-Tappx",
                    dependencies: ["AATTappxFramework", "AATOMSDK_Tappx", "AATTappxAdapter"],
                    path: "./Sources/Tappx"),

            .target(name:"AATKit-Teads",
                    dependencies: ["AATTeadsSDK", "AATOMSDK_Teadstv", "AATTeadsAdapter"],
                    path: "./Sources/TeadsSources"),

            .target(name:"AATKit-YOC",
                    dependencies: ["AATVisxSDK", "AATYOCAdapter"],
                    path: "./Sources/YOCSources"),

            .target(name:"AATKit-InMobi",
                    dependencies: ["AATInMobiSDK", "AATInMobiAdapter"],
                    path: "./Sources/InMobiSources"),

            .target(name:"AATKit-IronSource",
                    dependencies: ["AATIronSource", "AATIronSourceAdapter"],
                    path: "./Sources/IronSourceSources"),

            .target(name:"AATKit-Kidoz",
                    dependencies: ["AATKidozSDK", "AATKidozAdapter"],
                    path: "./Sources/KidozSources"),

            .target(name:"AATKit-PubNative",
                    dependencies: ["AATHyBid", "AATOMSDK_Pubnativenet", "AATATOM", "AATPubNativeAdapter"],
                    path: "./Sources/PubnativeSources"),

            .target(name:"AATKit-Prebid",
                    dependencies: ["AATPrebidMobile", "AATDFPPrebidAdapter", "AATOMSDK_Prebidorg"],
                    path: "./Sources/PrebidSources"),

            .target(name:"AATKit-Unity",
                    dependencies: ["AATUnityAds", "AATUnityAdapter"],
                    path: "./Sources/UnitySources"),

            .target(name:"AATKit-Vungle",
                    dependencies: ["AATVungleAdsSDK", "AATVungleAdapter"],
                    path: "./Sources/VungleSources"),

            .target(name:"AATKit-Mintegral",
                    dependencies: [
                        "AATMTGSDK",
                        "AATMTGSDKNativeAdvanced",
                        "AATMTGSDKBanner",
                        "AATMTGSDKNewInterstitial",
                        "AATMTGSDKBidding",
                        "AATMTGSDKReward",
                        "AATMTGSDKSplash",
                        "AATMTGSDKInterstitialVideo",
                        "AATMintegralAdapter"
                    ],
                    path: "./Sources/MintegralSources"),

            .target(name:"AATKit-SourcePointCMP",
                    dependencies: ["AATConsentViewController", "AATSourcePointCMPAdapter"],
                    path: "./Sources/SourcePointSources"),

            .target(name:"AATKit-AppConsentCMP",
                    dependencies: ["AATAppConsent", "AATAppConsentAdapter"],
                    path: "./Sources/AppConsentCMP"),

            .target(name:"AATKit-DisplayIO",
                    dependencies: ["AATDIOSDK", "AATDisplayIOAdapter"],
                    path: "./Sources/DisplayIOSources"),

            .target(name:"AATKit-UTIQ",
                    dependencies: ["AATUtiq", "AATUTIQAdapter"],
                    path: "./Sources/UTIQSources"),

        // Mark: Binary Targets
        .binaryTarget(
            name: "AATAmazonAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATAmazonAdapter.zip",
            checksum: "9feebfb4b92f268436f900139ca53bd5feee6e48da6e265efb2a2256d0bd76e7"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATUnityAdapter.zip",
            checksum: "668c0426eaa01642401547bb850ec997fa639d1ed494be2eb35c8dbcfdf693dc"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATAppNexusAdapter.zip",
            checksum: "0494abc3f33af19cff331d45f9b94feb21e43ec69dcbd8f9a3c0c66edf52e8b0"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATSmartAdAdapter.zip",
            checksum: "1635f30ffc52822813417317204dcec264a41b2f77fe7067d0f9c2d30412ed34"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATIronSourceAdapter.zip",
            checksum: "6a6ddd1d28f192b304cd80f24cc436892289d6fdc0ce9e5ae361d2efb48fe6f6"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATDFPPrebidAdapter.zip",
            checksum: "8defdc25dc574a94e3721289fa8cbfced2abb6f12e78fdedae542e243df36903"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATGraviteRTBAdapter.zip",
            checksum: "695c1bc11b1974c6d5fb83dc82f5dcd791dc2ba23623046150c250d688d4b589"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/DIOSDK.zip",
            checksum: "9c95e192d12e4f3e4b9142b3c9c741d01b4b980c1ae10a1e16bf883f906e946f"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/HyBid.zip",
            checksum: "ad8eafb490321e725b92da96462ca307d4deb4780f630800706b291d82b12058"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/OMSDK_Pubnativenet.zip",
            checksum: "e8561452fd22717e081006383e29d4cb34ca57a1b76a60d3b90ce815261fbf00"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/ATOM.zip",
            checksum: "81df0336f3798b09c3369746e1964285473a99183129546fd77a014e800cda03"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/Utiq.zip",
            checksum: "958601d0633fa6a863318ae5cbf505c9810fb0a3545d8d8225cca8bb725b2eeb"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/ConsentViewController.zip",
            checksum: "be0607530371e17ceff90f569a531664502f48a3eac53d7a4f94005a022ea597"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/VisxSDK.zip",
            checksum: "09a1e56be973f4607d02bee170defb9bf17415f07621e7359bf6653afa57770b"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/OMSDK_Prebidorg.zip",
            checksum: "236df54767f89097a2f1aebaa189643ca2337600ad36ddfd42cb2036e4e89933"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/PrebidMobile.zip",
            checksum: "7d4784adf9a9e013c4f8bbb6dff978706b0ea01b4da4d58636f044f36b1d27d1"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATSourcePointCMPAdapter.zip",
            checksum: "7c47b1028254e158c473adb2d3114bafda31ae9efd08b22a2f79a37cd18fde73"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATAdMobDSPAdapter.zip",
            checksum: "0b6d5c72c8628d6848009850bb13a26ea895369bb1fcd90d6030d27c699c9695"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATSuperAwesomeAdapter.zip",
            checksum: "5c3a372e05ca56aa198528c1021b068e840538daa8dd153c557aa243da19f835"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATGoogleAdsAdapter.zip",
            checksum: "052e1d855aee07c0bef647e995bf031222391de793e3d21719a609771322a80b"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATDisplayIOAdapter.zip",
            checksum: "6dc5512a61a91f0bd2200b1a5a30bf26a25259404e560becf1251798f5d854a7"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATPubNativeAdapter.zip",
            checksum: "b9da7eb0962f2acffb4550c1f1950783b67294997352eb97d2e036ac6b0835fb"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATMetaBiddingAdapter.zip",
            checksum: "06b41cc28aa534af66c69ad4ed2b827178c46acb395943a0a1f08072786711dc"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATVungleAdapter.zip",
            checksum: "d94ef8160545c1c1889063a8fc7c5e410fe659ec792c2180c22cc7b817fee61b"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATFacebookAdapter.zip",
            checksum: "b47ff2af25fb3af39bb16c87c24e6cd924ac50a2af6d7455cf0e16196e664465"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATFeedAdAdapter.zip",
            checksum: "0db7f95b36ce11640053af9590994a18e4e3012f31b070690c000d8342d30c8b"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATMintegralAdapter.zip",
            checksum: "67de3a9c23245a73642fc1d306eeffb8a695474bb963c1fb1c2eb13b829db232"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATKidozAdapter.zip",
            checksum: "251ad96ba5619d735653e29c636677662c5dbd88fe461e897c9f799e03c2c77a"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATGoogleCMPAdapter.zip",
            checksum: "f05f51e4e444117afebcf6fbd12ee77cd4e8a0dbb417389a33a92cb7921fb60a"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATAppConsentAdapter.zip",
            checksum: "08fc167046430030ae63b139d0807a36c9b58806ff90a8669b9e3447256eb4ad"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATMolocoBiddingDSPAdapter.zip",
            checksum: "c5ed505b0a2c5b5b42c8c152c367f1d80bdf59273ccb55c3c4c886128ed914e5"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATAdMobMediationAdapter.zip",
            checksum: "bc5946abcd05cd82dbbb74d61f18803751a8b408d4b02305b588606b5812ae24"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATInMobiAdapter.zip",
            checksum: "941dcc55a0cd2e246d40ada099016b8f50822223ec386b9ad8d17bc568b084e7"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATOguryAdapter.zip",
            checksum: "b4871941fe306d74729c9695517aa225abdffa03930c5abf63464572bfac50ad"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATUTIQAdapter.zip",
            checksum: "c9bb292fc710c99204f3a1d2e39c977cded0b9d2714205630bc8c6a7500bb61c"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATYOCAdapter.zip",
            checksum: "b0a498bff8a9f8b0117be98ccbdacde4611d400fbfe86c1fb99dadaf6df4041b"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATKit.zip",
            checksum: "7e1edf7dc0d463958109ef94eca3f687156e59a15fee5586c23925ab24da176a"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATTappxAdapter.zip",
            checksum: "90761e7f2e8709663e82608b0f9c54bb29ae2ad5b9a101fdf1a39cf4efd1f827"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATAppLovinAdapter.zip",
            checksum: "864c03efcd87eb1bb68969cf080c619f904ee1056c733a34fa599b1701c66e79"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATAppHarbrAdapter.zip",
            checksum: "1f4bc65de8c3de1eeeb0a76115c5deaa7bed74a900057d01e6cfd7b348c59620"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AATTeadsAdapter.zip",
            checksum: "2ff003c637521c25723ac1e956fd5ce8a1a6adbca030beb99a01b65efa995c38"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AppConsent.zip",
            checksum: "e2a2e8b52178a88eb9a51841f859af5b03e52d9339c57dd49a1fb96b31374097"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/UnityAds.zip",
            checksum: "16fbba52e94d18388f18c6aa0985e0d510577e4b4210cd3806f08ef1d635cc0e"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/OguryCore.zip",
            checksum: "79c09ccbf1533e52ebce8031aa9370addd9b96a714958b6def3977377ab16b09"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/OMSDK_Ogury.zip",
            checksum: "394e4a52d81b291eccf614ecef8f90128fdab68e7b9b621e87e3012c615993f6"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/OguryAds.zip",
            checksum: "764212949414c3ad4f1e4e5cb187080d30a3caf848e168817f4dec66a95a5098"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/InMobiSDK.zip",
            checksum: "8918def074c49ec750e90a3a926dd172f54114606fa2156cabc2ed1fcc072531"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/TeadsSDK.zip",
            checksum: "6afb1048f2f7b8157a770593c46c8372b4e35cbb9040937595d7bfb962a90321"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/OMSDK_Teadstv.zip",
            checksum: "2475affb3994295192f323395a895a41ceae01f6a59b20281991bb2bc9182fac"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/OgurySdk.zip",
            checksum: "94864d08b41f0c7166ac7ba1f1f3e0c37380d888afc902029a27a0748de8690c"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/FBAudienceNetwork.zip",
            checksum: "cf1e0f1ecad8952cec7095a6ab80ccc0b70ed6b57a65f7f226aff9e6242b1976"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/TappxFramework.zip",
            checksum: "feaf300d719715f59ac02d4edc09a1091e34079837d97784086c5f79beb3c632"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/OMSDK_Tappx.zip",
            checksum: "c01543887ef0b7772b8ffc983113cb9839b4c173769987999102c856b2e783a2"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/VungleAdsSDK.zip",
            checksum: "69874c7b6153cb648725ac4e39267e548af86f645134d97d3ac6716cf767c3ed"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/IronSourceAdQualitySDK.zip",
            checksum: "eb2784bc8547f64594960d39de0e61c1fcab05b7ff408e09470028964ebc6459"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/DTBiOSSDK.zip",
            checksum: "02a6cc27ceaf8201fcff36260ee3f34d55f6ca099b1bb70dacb6d3efac50871c"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/KidozSDK.zip",
            checksum: "c5b6d2f0e7763abd50df3518a0bd778185cf24453a820cf2f351e8b7f37cfbdd"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/FeedAd.zip",
            checksum: "dbaf8ab547f9ff4171571450e9def278a4723dc54bf809a7703730835209ad11"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/MTGSDKInterstitialVideo.zip",
            checksum: "3d7a97d5fef05f3fc892b23422df2da206d16be7e954bf36b11ee2549b305e63"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/MTGSDKBanner.zip",
            checksum: "e310e1d2da5c4021b97c6ee168e678baf0dac1939c1708dca79148f25fe79896"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/MTGSDKBidding.zip",
            checksum: "9a761c3f850cc0036a414761a50abb18300676b4d61aa6ac0ea3e7b6c44966c2"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/MTGSDKReward.zip",
            checksum: "dfdbcd29eed1528555e503fcfed38be4c375a078c1f7f2efef8fafb58ca5eace"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/MTGSDKNativeAdvanced.zip",
            checksum: "556fe57dc5c3ac05296256bcff308bd6f9c56e4593f4da865b78b565da20178e"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/MTGSDKSplash.zip",
            checksum: "222e5296d2685bb47a5aa395aea5c172672feab9bfdf8f75c903648d46de8a0a"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/MTGSDKNewInterstitial.zip",
            checksum: "4b97a368aac554283d83a108290dccff3a4c399a4c4e69b6897482a87e8b4142"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/MTGSDK.zip",
            checksum: "d5856bdbca6944db063d701cc752d4a8654cb3e5469423f0c7e69bd50cea1009"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/IronSource.zip",
            checksum: "93f0af53d8908280ee919ac42465fae947e66ab1afb5272b2c292f55d0630803"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/MolocoSDK.zip",
            checksum: "e8503c04612ab848e23e5cbc953e0931cf60db4bd70afcd9e372fe1ac32e6f90"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/AppNexusSDK.zip",
            checksum: "da887b5265016a962d27da28f9470cf816abe82b93a47e6cc4ee551ae7e84ecf"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta5/SASDisplayKit.zip",
            checksum: "7b034534ee91e7eb7eefc2cbf9dd044602f09894079d81b5de1ade2dbee624dc"
        ),
    ]
)
