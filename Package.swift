// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AATKit",
    platforms: [.iOS(.v12)],
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
                                                   "AATKit-AATMetaBiddingAdapter"
                                                  ]),

    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: Version(13, 3, 1)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: Version(12, 12, 0)),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", exact: Version(1, 26, 1)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSPM.git", exact: Version(1, 8, 0))
//        .package(url: "https://github.com/AddApptr/RTBSPM.git", branch: "")
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
                        .product(name: "RTBSPM", package: "RTBSPM"),
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
                    dependencies: ["AATPrebidMobile", "AATDFPPrebidAdapter"],
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATAmazonAdapter.zip",
            checksum: "bde390529f6645ded3bf8db1ac4bced6712a7f5e37deec2932d71310c5175f90"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATUnityAdapter.zip",
            checksum: "eb449ea699522570d20a5fb67424ad1eda68e5d6deddf25a9bd0b44c105da442"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATAppNexusAdapter.zip",
            checksum: "fd3378a642e6f3eeb2c2a0954e5b47c16a04110237e2feff65992547febdda8b"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATSmartAdAdapter.zip",
            checksum: "b3616a9ec10bc3fdc5a59e5367283fa27ef1971940a16ad4d3f52cfddc1c762d"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATIronSourceAdapter.zip",
            checksum: "6e584b5086c52e0e9758448791278067800c7ddadc38c09c0198c2bc5e17e839"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATDFPPrebidAdapter.zip",
            checksum: "33dbf07dff4df5a769b799988fbe908c0295e560682502e353a20183a0dba729"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATGraviteRTBAdapter.zip",
            checksum: "280ef3601692c2f3bd5c33f2bfdc9fbbbb668c685615fbd3f910400e025a7535"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/HyBid.zip",
            checksum: "2939fd37907ddfa477c5785dea0e7df0fcbbe35fba0e44148885d0a148fe33ab"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/OMSDK_Pubnativenet.zip",
            checksum: "248c926082ab8527fa70a071c06c166a75baa986cc8096f910b055048f00ee05"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/ATOM.zip",
            checksum: "f0009c047e82941efe66a9e2e6f8d410c460716bb37b829a727fdd7406e06d55"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/VisxSDK.zip",
            checksum: "f34fa6cb57d16f673f0028ce89ad46008a110aa43bc544f2450f9525b23fe4d4"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/DIOSDK.zip",
            checksum: "740b637f8d3677950b9d4675119a8a9236741ffc3204110a537dd945fe76aea4"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/OMSDK_Prebidorg.zip",
            checksum: "3bc3e2905b159fc4dad08d4526f818ad40aa53420cb1866bc9f9b185d58b06e7"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/PrebidMobile.zip",
            checksum: "3929348393d04852e4ef2c53957b8de63cf7cde6e6ebf9bb71b0b0351b9809a1"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/Utiq.zip",
            checksum: "1a4f1fd7d86e8e5fcd9e7b1e59d4a475a8d400b26e7eada8bcbbb8beda14af5a"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/ConsentViewController.zip",
            checksum: "04fc0a606ad33487094ee6b000c06887cb1a81b2f979d4786e7789a6e7a3d15e"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATSourcePointCMPAdapter.zip",
            checksum: "64739d2906d603e97f9c7fbe80e7fb7056a08bb9a891bd1f30fe071d27bca2be"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATAdMobDSPAdapter.zip",
            checksum: "655bd5c1e55f85e88f1203a7d3e2038ab21b3922579c809298094c36f904c35e"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATSuperAwesomeAdapter.zip",
            checksum: "d226ebd19cff96f9af6d4165e31609636ef9bb0d69af6358914bc0fa5f058fb1"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATGoogleAdsAdapter.zip",
            checksum: "d6ef9c12133bd411df2aefe54fdf2d729d166f62080027b42339f8a46241cc75"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATDisplayIOAdapter.zip",
            checksum: "19354497b14cf6dde02ad40219c68d9916e0c89327a1aba69f3c68c52e6f80b6"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATPubNativeAdapter.zip",
            checksum: "d9e83c600d4d19bca8eec35c04317df18355fb8114a103410e7e063ab404dbfd"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATMetaBiddingAdapter.zip",
            checksum: "c88a69d541368872f9f27416ba5dc809d5962ab44dbecb63e4fd9ebb052d0d36"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATVungleAdapter.zip",
            checksum: "446b26080060454673710221e7a7be7f8632547e9b89c6e7a77a2a740db09c76"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATFacebookAdapter.zip",
            checksum: "c470abb8c774f97fdd84ca6bc6804c96a7f69793ce183909daf5090bb828cd82"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATFeedAdAdapter.zip",
            checksum: "c54c4e2782c1af8b3656df06b91b3b98d6928f469b89752f7654078dcc1a3077"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATMintegralAdapter.zip",
            checksum: "185613d35efa05a71b1292a479a756a6232c69f787bbf3291d08679f4479b114"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATKidozAdapter.zip",
            checksum: "86caa6f6050f8b36be2734e25fac25d25f105f63bb43bea7ee73b11699f15a38"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATGoogleCMPAdapter.zip",
            checksum: "f863c34d2b6ea426cf2dcbb30f8cbf21fc65ac3e0915a83f4f700b805e7a969b"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATAppConsentAdapter.zip",
            checksum: "0500cf56ebb82e41673c3b56b36c016bf5a07348a789aba07b022b1bf85d253c"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATMolocoBiddingDSPAdapter.zip",
            checksum: "a25741e3a1d3264c142cfd51a0f439521232734d4e0331faa7e0123f2a46110d"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATAdMobMediationAdapter.zip",
            checksum: "8bb93800d1fd9726f2653797775ed9922a69961542fe36d9ca2ca9f4a920ffec"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATInMobiAdapter.zip",
            checksum: "a4639636209efcd23395c40d7b2bd3d05a352f0e09371f82843987516314fa15"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATOguryAdapter.zip",
            checksum: "c85209f12f7d459462d79d5358a652f6638ab34bffba78b9800d52339eb9fbbf"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATUTIQAdapter.zip",
            checksum: "6b5c71ade7addc10a9ff0fa911ea9609811d70a6a4974a9c612869d972bc9a57"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATYOCAdapter.zip",
            checksum: "7213da4c70d02cca21c550b1daaf919ff380f519c9d9e3d99528c30b0876e24a"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATKit.zip",
            checksum: "5d381190403d7ecaf5899c4662e5a1e265890ba322b3b18af39590cb6d91ba2a"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATTappxAdapter.zip",
            checksum: "f74090c5904e138cf762ea2d3bfe6655885816d0bfea5b0f5c2a5b03183caafa"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATAppLovinAdapter.zip",
            checksum: "19b3cc199f911d88b697fbe1b7ad095c874bbbc261e3d6e17cf5e1b950f101f6"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATAppHarbrAdapter.zip",
            checksum: "3ad19250e030ebccf6ca2999f327deadbaa7bf910cf445ad18055596a7f8953e"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AATTeadsAdapter.zip",
            checksum: "cac6edc5dbc46a94c4188a422012177617842a982a4d1a664a6d8a96e41edca5"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AppConsent.zip",
            checksum: "54b6472f2513becc05de10317bee27c7adfd6693dd1e0389fcd25cfc77d14717"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/UnityAds.zip",
            checksum: "985bcf7918b109269b2ad921c813af76e02e93dc77381dd06b31c2898da7ed2c"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/OguryCore.zip",
            checksum: "7a8e743bbd95a7278afb0d3943403baf951f3a94462b7d97e3c854ce5e8d232f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/OMSDK_Ogury.zip",
            checksum: "771ba4a6ee4e565ea8b419cc6b4eed53955f5861b2aea6121c32dea3f874cfe2"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/OguryAds.zip",
            checksum: "45325d7a4f624aab0ba8f73dc7fd77b90cd11869f5e2cbb7a1ccc0469a496a09"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/InMobiSDK.zip",
            checksum: "bfd0f62e270ede5714f8d78471e788f7d571cfb301e2914c454358fb1eb8a6d2"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/TeadsSDK.zip",
            checksum: "f3102146959298fb786400f5203cb66338778c76b4dcaad30277eada332f67f8"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/OMSDK_Teadstv.zip",
            checksum: "fceec9ad058d0007c85c2c7f61eda3a465a000ec327162250b7fd9c5ec849f31"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/OgurySdk.zip",
            checksum: "fa174de3bce5265409a97800e925ceb0cb24fa1ef21e06d423397680adac01b7"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/FBAudienceNetwork.zip",
            checksum: "a520732faff4ba6e171c63242ad0db353d7d39370d94760ec6838d4eddd8b574"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/TappxFramework.zip",
            checksum: "211110d33538a8fdd0b2a5f85dde992a9e64642a3adf20f3070dd7221fe51429"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/OMSDK_Tappx.zip",
            checksum: "4363fd8f59664730f4ff1e23edcad7ebd9b1331f6120148afbd5e48d42893423"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/VungleAdsSDK.zip",
            checksum: "dc97937214cb8397a2ab68d3e799a3eb6ca563e24eab43c52e23c618803c70b7"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/IronSourceAdQualitySDK.zip",
            checksum: "31263346cd53788630fcdbf3e28b8dfb5e29b3a6709672122e5bbafb1453a6b4"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/DTBiOSSDK.zip",
            checksum: "903fa369b7df989bbbec0fbfb461113fa019df65377022e25b7860d0d51c5468"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/KidozSDK.zip",
            checksum: "71dcd77ecce8222589b88c1157eeb66bf339c486effee4b71a0d75aa09487b5f"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/FeedAd.zip",
            checksum: "6c9ca5c3a23a489440fb52ec4b9a02e3892d8549d5aa48f2d34549a192f87e49"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/MTGSDKInterstitialVideo.zip",
            checksum: "5edfb3befa9bd2fbc3d265fd1fd40a8fba8e1adfb1bdc2a38c0697852b356f73"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/MTGSDKBanner.zip",
            checksum: "4df85e0c29f061a2589730a11160820ce42b9a42e8553655772307206a3e6263"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/MTGSDKBidding.zip",
            checksum: "77dc79bba2f7a2328b51370222bac6919e9b5b6e961a2431e49271bf0481973d"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/MTGSDKReward.zip",
            checksum: "c6677472ffe01b8703dba6cae264901de306e19e090995b1b0cdf9bd268b287c"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/MTGSDKNativeAdvanced.zip",
            checksum: "7c8a61a290cfcf450a58d135574dbc47d6190d7a02bb283c61409fbf5609ae45"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/MTGSDKSplash.zip",
            checksum: "ad40c796bb0616b2d7dfc10726650042667ebf018ea16e4e7f3c29072dc7c7bc"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/MTGSDKNewInterstitial.zip",
            checksum: "bc0a263db5b246ad8a823aa1cf85be3362dadf51d585d9a4aefcd6591cf0be31"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/MTGSDK.zip",
            checksum: "465c225946ce3e949dd05a9bdd2450a1355454f3ebdf205301e981cd610857a0"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/IronSource.zip",
            checksum: "d3410177ee751c068b4188bd74cfeb68ad457f9b9c8d488cd1a3787ca90b4015"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/MolocoSDK.zip",
            checksum: "3b83eb2cc5eeec9f39e3dc35dd8f8d86f5c12a4220173c4e452f60e36e617d6d"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/AppNexusSDK.zip",
            checksum: "6e5b03b392d02909126031ec491aa23c7a872a7195584afab204909428093f62"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0-beta1/SASDisplayKit.zip",
            checksum: "b6c7313f1ae8e56b6e4e6976d70190c3fe859ed44e5a3af14086a63685b1db48"
        ),
    ]
)
