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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATAmazonAdapter.zip",
            checksum: "1f7ace04d78946ce8e957ace9c6b49e1787241d0b44db211650ad38873f46fc5"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATUnityAdapter.zip",
            checksum: "7c0660784d9c69659368dbb95b190be7841e7f996055f6e89f823eeac31f2fe0"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATAppNexusAdapter.zip",
            checksum: "bb1b840eccd4b46774695bb24e8f69f20c69664b4b70c06d7c3e4fd13b4dfee6"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATSmartAdAdapter.zip",
            checksum: "76d2bbb9aa3ed0586f9071be343abc22cc5e3aa67ab133cc3005e5f982e7e020"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATIronSourceAdapter.zip",
            checksum: "427056aecdab259c7a801ad324cb9980cb25e464bc6244bb1bbd7031c4ffede6"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATDFPPrebidAdapter.zip",
            checksum: "3eed330d2c8e4cf0d71fc052167d846dfd3094b230c658911355f0b8a06caa5b"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATGraviteRTBAdapter.zip",
            checksum: "7034d1ebba66a8175f65b2a835ca676d0bb7b71717f4ee14c51496ed1b0a15bd"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/DIOSDK.zip",
            checksum: "2a02804db177e6c41f855d66938f2c06727afb783bf312e911ad28aa50654bf4"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/HyBid.zip",
            checksum: "456c8bcd9bd3a8b296bc1fb02f46e8634495a654cd003c20925d0222056c8fc0"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/OMSDK_Pubnativenet.zip",
            checksum: "2c2b628f14484520015e90cd8fe6f99f6d22cef2a862078946103eb8f85b2612"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/ATOM.zip",
            checksum: "1640d59846c236f902a463752b58048fd08739f60e53603b844da699d3322562"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/Utiq.zip",
            checksum: "0fc503af68557497fbbb597700b4ba0ca1ed82ddb88646be2696c300a35a0ca8"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/ConsentViewController.zip",
            checksum: "d8013cf67c4dbc447301aa70501d3efd8b83f7ebfa26d34d59a8a8f4c96edcd3"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/VisxSDK.zip",
            checksum: "3fcb2b007727f5969f4c76f227d7a83f4802bda24393758cd8de67798ff50e3a"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/OMSDK_Prebidorg.zip",
            checksum: "f4acc75f36ef14578d9a9efa9233fed6f8d600f76300b59b8ce8dd3bd6c07854"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/PrebidMobile.zip",
            checksum: "6e3cb8990151b05e3390bc37b7e347144009dbe61aac381d488594332d297112"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATSourcePointCMPAdapter.zip",
            checksum: "b3c55249d8966c96277de41cacecf102e60bb674d099498d121c33379f0d31aa"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATAdMobDSPAdapter.zip",
            checksum: "a6495372ba77ab80c58ac3ae41de712bf680bd9b480013edb7cec8a426ac9d21"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATSuperAwesomeAdapter.zip",
            checksum: "4990a11b7cdbd8f3d33eed52f2fc645b06f2f267cd92fdb9740609d4d52b6efa"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATGoogleAdsAdapter.zip",
            checksum: "f7a2c234d0de8c2268e36c865b44f1b2f91ad7925372d738aa88a3a8555feeba"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATDisplayIOAdapter.zip",
            checksum: "72c2700fb145d9487d498850297e926a5c59c743fd466896ef804780499f8601"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATPubNativeAdapter.zip",
            checksum: "29c930dc498e0cc0c13380b2e8793dd9ec0c6a4293d8435395253b278a29334d"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATMetaBiddingAdapter.zip",
            checksum: "fc4ad3c0fc99be89f84d6238b41789c7adfd037bf419abd33183b581c83249a8"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATVungleAdapter.zip",
            checksum: "8ed95b6ae194a10a582c173bcb7f8199cae1055b4e93d239ed4dbb7b04c11d50"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATFacebookAdapter.zip",
            checksum: "2dcc41e8f8a9e57ea042d3912fd013aa7ea56cbc2ecb8e1a840012e13dfa328d"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATFeedAdAdapter.zip",
            checksum: "91be0d5bd51ab62c9a60ed678e5e7f48482c9c753846dc3b0bb254d23baeda84"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATMintegralAdapter.zip",
            checksum: "25d394e35482bd3a3d2efc8034cfed1c4502ff1daeba57b6361c4e3e443bd0e8"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATKidozAdapter.zip",
            checksum: "892a555403edb86ed6121d409511b33fda859c60760312c9f23a404c40d0228a"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATGoogleCMPAdapter.zip",
            checksum: "45d568640c9d362f0bd5ea21c6e3c464e23831f2e6befee5ebf25181cad21040"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATAppConsentAdapter.zip",
            checksum: "47312ed0d784acaedc27f3bfa8a0f0cf6ddae8d05f7fdccc180bb54db473b265"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATMolocoBiddingDSPAdapter.zip",
            checksum: "b87d65458564357022a4a80795847cd2e04b2cfcd5f2f335f6408fe3942b29e9"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATAdMobMediationAdapter.zip",
            checksum: "9cfc92a2febfdcf03b1a0a986838c2401c4980681e648fd98894053dcc8af8c9"
        ),
        .binaryTarget(
            name: "AATVungleBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATVungleBiddingAdapter.zip",
            checksum: "a25af67fc910c099b77839554c7fe36086552b9e2b0d3297c15d817b0b394844"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATInMobiAdapter.zip",
            checksum: "1d9bafd4139357563e57e3396d6ac1671d98793cc1280670d70a3ec85f14f4d8"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATOguryAdapter.zip",
            checksum: "484fca518ef5ebfa39f84ad9164ab87051897bcea803cf8c280266ae59ce7bbc"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATUTIQAdapter.zip",
            checksum: "c7599236346f2066d32a9fe39d2b67a13f8aac2b2f9b3781298bc3175747db49"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATYOCAdapter.zip",
            checksum: "c3aae18d3ed9b790086da8e9c079e3c266c7c8c364d797619ef26cf0af2412a1"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATKit.zip",
            checksum: "4546a0d26c71f3298e051b795bbcb590c09470353137a670615106cca2fd6bb6"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATTappxAdapter.zip",
            checksum: "65acd2f84c589d57dd4f43c797e70be05f5969c4f02cb2c4d8af703b57c8ce13"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATAppLovinAdapter.zip",
            checksum: "a860f78cd81d89aab48d13a879711fd060ee1b7316c6a9d036a2e3afbbb5bd10"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATAppHarbrAdapter.zip",
            checksum: "dd275127caa46c9d9f398c5d36f8da80018bcb8fe4b31eb2668b86a9b4c9614e"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AATTeadsAdapter.zip",
            checksum: "9930de728ae958d283e12c817e998f2cd81a664a648c562c1c74c9cd85965921"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AppConsent.zip",
            checksum: "b57e95558d32be5fb884355baf3b96b7c89d9322e17c1926a99216dc19a6d400"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/UnityAds.zip",
            checksum: "961610b7c2dd6d2de0c29d4c2a8e3c6fec5842da8cd5519ee9151ea99c0207ff"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/OguryCore.zip",
            checksum: "74c44947d6197dec72698618067910395d754721b9779dc0fb7d81d2fc7f26ce"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/OMSDK_Ogury.zip",
            checksum: "4095f2918f4ce773a26ef8bb6e8c5374daadc09690831f5a96ae032346f2eda1"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/OguryAds.zip",
            checksum: "b5065cd52f7b5ca6ff64250cbc74111fdfd932655ac6945ef8e5c5ec53517500"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/InMobiSDK.zip",
            checksum: "25ba84b35ba8e73dd75b468ebd628372f34b7918ba802a5fdd4c4ee065ac8a5b"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/TeadsSDK.zip",
            checksum: "25448edc33668e3c643836a2938002fe420666bc6dbd9801e29c3b40fdffc14b"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/OMSDK_Teadstv.zip",
            checksum: "5948fdd66dfc84b23b589460f1a24c7cdd95fe780caff3f2e225e8bfa98901ca"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/OgurySdk.zip",
            checksum: "df60693b76da4cc9cb2743f008c4141bb5835605aa47f62774128510e866798a"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/FBAudienceNetwork.zip",
            checksum: "516b62e256c356b234b7739228c5ac1aa2a2c4949f04c0623bd76ffff5f51c89"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/TappxFramework.zip",
            checksum: "dd733e4f259e992145ac5bcdde582e4f6af8dd8ff595356e7df210376300c57d"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/OMSDK_Tappx.zip",
            checksum: "21e2b9ba59bf26386994eb2b17bacef1073b035aceda7eef90a0eb26a4aae412"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/VungleAdsSDK.zip",
            checksum: "7698f64869e2b8aa0c953cddf7299dbac8c9d5252088f7d4f8d696f750e7e953"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/IronSourceAdQualitySDK.zip",
            checksum: "7dcd649d1570e228136f3fb658d8bd2190dcb4e0bb42110e6a8e155ea83c1f7f"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/DTBiOSSDK.zip",
            checksum: "be5ad786f3d0f6279045db2b3c3a4f0bcba8c0b7938db8657faee17a74f39d73"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/KidozSDK.zip",
            checksum: "bb268b18920feaf37ee8e90f63d3f014e42c0e27e9047f8928a827b454909a5b"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/FeedAd.zip",
            checksum: "336ad142c7d5f94e7d04518cb5fb6f30b95cf135b6580598d69fadd0ca2d4412"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/MTGSDKInterstitialVideo.zip",
            checksum: "d98439d271d7f806abf4bbdab8e2725cd674211ba5d825293f6dc3bac3450a4a"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/MTGSDKBanner.zip",
            checksum: "b81e020f72ff06daffbbe126e7749dac2a8df834be48d05571977f8788c60a1e"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/MTGSDKBidding.zip",
            checksum: "a13a9a2dea5e90a40cb4fe3dc2ce83fc08e21dd41d84972f3db652ff4ffaf3d6"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/MTGSDKReward.zip",
            checksum: "2f62a2d79250a5573f71b8b064989a8c4874c8116e102df0977df5a2dcef7e45"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/MTGSDKNativeAdvanced.zip",
            checksum: "dc1e781ac7538c2536ab7dd840c4f9b959fb30b7d261f4067142b3e11112514c"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/MTGSDKSplash.zip",
            checksum: "b1765148ef2d518430d0c7f33aaef39620c7d6ea2fb98dc96caa3b810eabe4ae"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/MTGSDKNewInterstitial.zip",
            checksum: "18b6ec81b47f3e5bf2b06e46d9337350f132bb5af84318d8e4473419a11487a9"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/MTGSDK.zip",
            checksum: "d74dec776b8cfa1a7d1f7a55bbaf3c1e93841ebd98b5cc8b8cf8c5f86a34af7e"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/IronSource.zip",
            checksum: "33b2ea809d7ec6e777d4bfffab0931c283cfdd3deebf8fbf7e5309e82f1bc38e"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/MolocoSDK.zip",
            checksum: "ada213562971aa37214c59898eb3ceed458b06151855f0971e00bdc2892bb41e"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/OMSDK_Microsoft.zip",
            checksum: "5d1d971e344349761588fe4479b46c5ce79b467c32e2ed8763bf72187cd5d78f"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/AppNexusSDK.zip",
            checksum: "e33313f60997e5eca510b58a977940775bd83a7f28e5a23500e27ab5f2c533eb"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.1/SASDisplayKit.zip",
            checksum: "c581d337663177afd27c14c554269cf0a9993217b9c8eae5f8dbfcbcadb9a2db"
        ),
    ]
)
