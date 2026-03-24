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
                    dependencies: ["AATAppNexusSDK", "AATAppNexusAdapter", "AATOMSDK_Microsoft"],
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATAmazonAdapter.zip",
            checksum: "92968fba74822f991af6294319605300494f772b42d56c25b15f9023a10aaa3e"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATUnityAdapter.zip",
            checksum: "e1cef04647c2ba4272208473a4372b78c55e8f459ae78e74a0545a6fa390287a"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATAppNexusAdapter.zip",
            checksum: "26470890e900af02d7d2f8d904d7f8e0adea4a7ddd8dc86974ada797289b611c"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATSmartAdAdapter.zip",
            checksum: "a990b762e6c2c1cb615a9444d0e0e418839a11d8dce983b13cc05afa2d539f00"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATIronSourceAdapter.zip",
            checksum: "7b972fe931c190ff0c822737892e78be22d050a32f772e993fe7cf9497f39a92"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATDFPPrebidAdapter.zip",
            checksum: "b341c4cb7a2c4872f64e0d8d1ab05a92735c96d8f258d416deb2f46e4f1225c9"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATGraviteRTBAdapter.zip",
            checksum: "b8325ed0668f7125f7356de582db390378fe864fcbbc529b11678f93acfb3a96"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/DIOSDK.zip",
            checksum: "3ecd3535eb570253602849935f549dde4b5a28599a509cf96c32cccc2824225b"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/HyBid.zip",
            checksum: "427138e8babe7a8596d12d36b3c4ec89c70e774d9f0641aee1461e57ba57a513"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/OMSDK_Pubnativenet.zip",
            checksum: "1c37af276e1d26bb1b82b9354331c6516083d60f641cdb5ddbe8fe83929bda71"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/ATOM.zip",
            checksum: "02b42f29bbba6525cb2dc54771493ae1553fdc56b705951a9d92f024af8fa8d1"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/Utiq.zip",
            checksum: "5359ef737a9152c0caecf51e8bcb11934936ee4dadec84639f44858cffb310bd"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/ConsentViewController.zip",
            checksum: "332e588b8b6f69f84010c9a152643c4427f50b5f3fe18dcdff1f65800afc0e0c"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/VisxSDK.zip",
            checksum: "05d89ae4ed1df5830be6e48032344395c781656aa8b8ed790caf6eda45257a9f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/OMSDK_Prebidorg.zip",
            checksum: "3ec32e79872a2edadb45c111ac5f07f22a8f5a68d831727e0576f51fdca51fa0"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/PrebidMobile.zip",
            checksum: "cb86acb6c3fce9919adb2490e8e381affb2b83a21a889c49127afbb9b54ef192"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATSourcePointCMPAdapter.zip",
            checksum: "94994eb2cca95041fda850b60febecc7dcd4e863e02452afe82bbb01496d7fc9"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATAdMobDSPAdapter.zip",
            checksum: "883f8985bf7affd5e91197bcff834ad6c1867e901e153fe92776df26224abb39"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATSuperAwesomeAdapter.zip",
            checksum: "2cab38d62c9412a66cd4c343aa514fe4b52ad4ae1e0fe9c04fce1f9f4bbcc11f"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATGoogleAdsAdapter.zip",
            checksum: "8621992585025a3293062cd38e92db2624be1e4f133fe62faf641d44389d899f"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATDisplayIOAdapter.zip",
            checksum: "91516ada8d8e6d23b54a20c7741b95a6a18f4078c9665bd1f2213fb5aa5eeed9"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATPubNativeAdapter.zip",
            checksum: "103c2574dae1ed3452882eeb9d8ca024799247102dc549b6a5be52e55d4bdcf8"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATMetaBiddingAdapter.zip",
            checksum: "2e9f527e4dba756d8458fc2635e76d4af3a128623933a832f86e6134179b5024"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATVungleAdapter.zip",
            checksum: "c270fc349b4c76cfaca29a206d13e36821562bc09711ca8d4b26161f1555b345"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATFacebookAdapter.zip",
            checksum: "d3841c1626c2e8fa07b124b34e6ae5461f3fe8d98751795cee13f2d59bf0859a"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATFeedAdAdapter.zip",
            checksum: "8817601a0dba36fc888226a9b4ea0a27f46edcc5a06f786441980c57be39bf0a"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATMintegralAdapter.zip",
            checksum: "600597096c38796cd7aef631cff754721329ae911fc9fc713c06f9c1c2a1cc17"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATKidozAdapter.zip",
            checksum: "7ced9e8c855d623546bbd3d370510d7d7cbd74ad443b836f27036f4ad449ba68"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATGoogleCMPAdapter.zip",
            checksum: "d09c189a8989ecd0b1538c76c9752e4af22471393ccda0acbff2b81e6c04368c"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATAppConsentAdapter.zip",
            checksum: "3c496cb5468655697a428dfdd206b70809ba1bacde313ede7cb5e7e78e73b6ad"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATMolocoBiddingDSPAdapter.zip",
            checksum: "fc34c3ab5c9491b1b6bfd3feaebe8de473e1f89d503c3ad1c39b19f1e24d1ddc"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATAdMobMediationAdapter.zip",
            checksum: "56a0a913e3659d2c6c7e9aa34b5205a077a32149cd70beaccbbae6aa31896e4a"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATInMobiAdapter.zip",
            checksum: "0fe23a40dc7d3f4a86c2a3eaabc347a03a232a10ce05fa3b2a635ef7bf5f5b13"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATOguryAdapter.zip",
            checksum: "41f0c5b01641344a145427135bdfce5f5c95cf7d906a04357dafcff328436e84"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATUTIQAdapter.zip",
            checksum: "a3662e101dd5fa4c09cd24e8290c5e4652eb91d2766542b0e111db2b1e8f722d"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATYOCAdapter.zip",
            checksum: "cdd4e9087491f0eb15f7735ad123b20abe3ab0baf76e4f7c3580c0c1a2e3132b"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATKit.zip",
            checksum: "db59f50ca2afb3eae96727da8d21279c587c4943f44bc112ff7670f160a4de3e"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATTappxAdapter.zip",
            checksum: "f3ee58b18fa4b9ae9183238f22e9706829aeb17f354b7c581a406f01f2660a44"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATAppLovinAdapter.zip",
            checksum: "36a68cbcd9f8c8f900494bc56c5409cbf58bc3977d5197d7024a9a0aae9a85da"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATAppHarbrAdapter.zip",
            checksum: "786cb0a60d6c05f417ba5b6bdf43610cb0f9ec1e86098d477c0a1be7bef9e188"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AATTeadsAdapter.zip",
            checksum: "1bbe591b2127d167abe6d35c42cf78e1b5fcaef0b144bffee2af86214ad95248"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AppConsent.zip",
            checksum: "e3c1d3a06143656652ad999068986d68de2aa10cb504969f8b649dc3d572bf46"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/UnityAds.zip",
            checksum: "59e77758adcd1935f3011b709e317729de2e4956a67f30a05f36af3ecd99f2f5"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/OguryCore.zip",
            checksum: "97324b0a23df593cb55905b44d54dfb378f0b515895e9b1fcc2896a2fe76e4f7"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/OMSDK_Ogury.zip",
            checksum: "22ede8b38531aea109e601a8c3ad03344767a63430164c71379d803b69e4113d"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/OguryAds.zip",
            checksum: "630ca1fa1bd39dff250dfbb8d12ac683ed27e9a61e42d5da58aa1813a6fc48d8"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/InMobiSDK.zip",
            checksum: "45623156cbe906b73d504ccc74ca2cfc4b1f7ddc1015715f3a74e97d108e93c4"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/TeadsSDK.zip",
            checksum: "af6e431d69b3a957e4774a7f5c6679653e58cedcda65982cb08d5407300ddfbb"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/OMSDK_Teadstv.zip",
            checksum: "12084b00d97d722318aa61ae707d0efdedc39fc10ca70eeeaf43c1a04f05aaa6"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/OgurySdk.zip",
            checksum: "e33133fe2e4e0fb6da62810e724110439fb921004940dfba9b0916fca054be0d"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/FBAudienceNetwork.zip",
            checksum: "a8be7de897e8868c33d29c674c06e6e1d6f2761ac60aba9011188f3871f68eab"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/TappxFramework.zip",
            checksum: "f627a454348bf0e149e56af5cd1660cc83c7dfa914f0f34c600ed441811338c4"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/OMSDK_Tappx.zip",
            checksum: "327d618cd32404207215f8d02e3374039184e1fe6e0d97c86edbaf8d1ae0720f"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/VungleAdsSDK.zip",
            checksum: "1ce1d3c41aeba7cd7edbdf5dcf3028a98a3f4d84242078cbf082b0d982547a4e"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/IronSourceAdQualitySDK.zip",
            checksum: "ce864e8db82cb3a3aa4d787dfed69037317e1a8d12d7886dcb7a5702c39dae90"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/DTBiOSSDK.zip",
            checksum: "591e952be5dc04150171b6660c917561651bc9419f129e85d0dbce9d0ceafe90"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/KidozSDK.zip",
            checksum: "941629e8b46312b1f5ddae03f5f970411af32e277483a60d87ff32273952006b"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/FeedAd.zip",
            checksum: "f04dcf1b0f44ef20abf6d27bb614c58aa8b78e39a5d4475210c72d2e7e6f366d"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/MTGSDKInterstitialVideo.zip",
            checksum: "29d6164acb088464e89c2e16fa180f238f5a2b8a416ddce9bff933ffb1cbf074"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/MTGSDKBanner.zip",
            checksum: "324b0a9b76df0846f68e2b39677935355c7af636059670bdabdb8f314e601613"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/MTGSDKBidding.zip",
            checksum: "75244bae8d2e2beb8f1451d3c6834c136250c634fd8964d33dc75a466f91932e"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/MTGSDKReward.zip",
            checksum: "85902c3e2ce03a4ff15e01a8c011f1a7c6c6d364152c22d3b12f7244f46d374f"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/MTGSDKNativeAdvanced.zip",
            checksum: "d95f1ac8cf4d8d780eebfccd7eb60dba087de19ad266a9fb296b70f85e0297ff"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/MTGSDKSplash.zip",
            checksum: "dbd2ea1089b0b44bd3ea3fac24f149de7f74c35b558add36e595ba815cc8d99e"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/MTGSDKNewInterstitial.zip",
            checksum: "e8425b90021ececefb9428dfd475f3bc2ca9a3dd14599afbb9a5693ab37469a4"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/MTGSDK.zip",
            checksum: "f3b0ad0af96acccc0c3604a9c88cfbceed00cc36b1aeae0aba16ea4efd5c40e9"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/IronSource.zip",
            checksum: "985b26d5f5f674d362b1ecbe20df5b65ab23a3438a4cbeed44a7bc4b4d51ef32"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/MolocoSDK.zip",
            checksum: "a56bbe491c146c9b0effa64decc9f02d81538c48d6566b1adec1412f8140a91e"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/OMSDK_Microsoft.zip",
            checksum: "2cfad07827577cccfb68494782bcf98adb197a1c45922ef09d354ec141664885"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/AppNexusSDK.zip",
            checksum: "f78c172eb17c7d1bb8d187f62458c574f3d00ea960410730791e93280f90bf00"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0/SASDisplayKit.zip",
            checksum: "23311238a7e2a4c11769d06b49aa4fd3a8c9e1fabd810f4dc20db383e9940097"
        ),
    ]
)
