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
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: Version(13, 4, 0)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: Version(12, 13, 0)),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", exact: Version(1, 27, 0)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSDK.git", exact: Version(1, 9, 0))
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAmazonAdapter.zip",
            checksum: "2d34e4374db5cda3254429c59460e30ae304106316f205405304582bf5da2bd3"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATUnityAdapter.zip",
            checksum: "20774e72ff95d234331c9d7e3da50f5cf31601b32450e93d6ff6082cbdd0badc"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAppNexusAdapter.zip",
            checksum: "1ac28873f8f787154be6d501ca6fb3d1625c4a4f6bf810f6ccfc5aa910472bd6"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATSmartAdAdapter.zip",
            checksum: "f5873a8e2f45746062fe4a9fbeabc22b23a90d224d0423b3eb092805d0b34328"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATIronSourceAdapter.zip",
            checksum: "a3d122957330b640c3362483df18c014f2c6ce47ddb398335aa75187f3fcea35"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATDFPPrebidAdapter.zip",
            checksum: "a97c3a3f7bcea5ea7e53a30575ff3fa02c75349167c23b6d4283cbabff720b5a"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATGraviteRTBAdapter.zip",
            checksum: "bc6967643152e2a2463c3ded7646774a83e3935ca5b0a2b44a5cc1b599fad878"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/HyBid.zip",
            checksum: "02d0b62fed6966dba4f7b64b3ec919b2235d54ef69acf03cc2ad83ffe8f1f907"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OMSDK_Pubnativenet.zip",
            checksum: "e4f3f3c458ea468271bf1d7e1eb063d9148ab58bdf4cabe7554e3a158be310f0"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/ATOM.zip",
            checksum: "52fbe5648ee345c0223ef63c4964173d5572749887ba66094e0ac8c1298e6946"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/VisxSDK.zip",
            checksum: "9b611a95a129138ffb1569068dbb6c6cf8d54fff13465ee2c19dbf3e528f09f3"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/DIOSDK.zip",
            checksum: "4a1d97131b772ac44e0ba0fbf02d6a8caf714a473fd0ddfd044415d2781b976b"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OMSDK_Prebidorg.zip",
            checksum: "a0e123688209069b48d10ae6f0898ee211c6a5a7da89067add0b21106a9d47e1"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/PrebidMobile.zip",
            checksum: "8e4e0f7bc7fd7bf3e402a4289414d4aa707a28365c0df9e4f2af56a75fc240bf"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/Utiq.zip",
            checksum: "bc6188142e79459c3bbee11f834b1e036ab73497630e8c2bcab1e77d8d4cabf7"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/ConsentViewController.zip",
            checksum: "19950734540fc5ec00dba3d158fd2a615a0a3c6b80049a6175accc76651f39c8"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATSourcePointCMPAdapter.zip",
            checksum: "0e819d5444b1dcfc0adde209b68d39aba126f39218b05dd0e3ef6ecb4373a6db"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAdMobDSPAdapter.zip",
            checksum: "37a49c56cd8c3ef093a06dde33fdb8a154fccae96edebe8f80d9bc928dba9289"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATSuperAwesomeAdapter.zip",
            checksum: "ac32fa4d2b6b11ca049109e6688c192b1b70fb1853c574d68f4c2fec103fb6fd"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATGoogleAdsAdapter.zip",
            checksum: "f14025a270319f0e406e2e9020e95605ee33375a4bc5168d87b97076df075d9a"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATDisplayIOAdapter.zip",
            checksum: "58887b15f2269796498d52cf64a117567b4102d59c9adb72e459be1e62a8a7d4"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATPubNativeAdapter.zip",
            checksum: "39f0775008a02ea65bcdba7336524d3e63a3b307e01c900e045ae73759d49c23"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATMetaBiddingAdapter.zip",
            checksum: "3af24dac80d95e799361940a1899f055070029aa33652668aee0d9f6fbb5cedb"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATVungleAdapter.zip",
            checksum: "da422d158d54bc1849174e02d2ed889136e6a2a201919c9bcf0a166a8a9ec208"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATFacebookAdapter.zip",
            checksum: "3c5f26724b12c760d8fed552bec583a91af37be99ddc2307791662865b2c629c"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATFeedAdAdapter.zip",
            checksum: "2af58a38576e14ff2c8f73538eba9b7043b8f4113cb91af1a9b56f08c311bd02"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATMintegralAdapter.zip",
            checksum: "0997910c4d47f3be2ee4cb9d0bbc34b4387da80f73a242d43eb31afad1a889ea"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATKidozAdapter.zip",
            checksum: "e5815d5b2016b29f3461579fa578d81b8d03ff45b8628beac1dc20015ee3f4ab"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATGoogleCMPAdapter.zip",
            checksum: "faf4dc9b93d4ad98f1ff7e69ddb10c9558e1f7354d4a15f91c5e318f5be573c4"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAppConsentAdapter.zip",
            checksum: "b5b813184fb09c9ed1f4d704da427890eed47748304c048f66ef49535037f276"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATMolocoBiddingDSPAdapter.zip",
            checksum: "65ce2da663e6685f2423b331c750cbbc99dcdcdb515273dae34fdcb38ae8b8bf"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAdMobMediationAdapter.zip",
            checksum: "1c3098fba084531d36f34173cb2f26ac71031b95a052cde011760475a6e2794b"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATInMobiAdapter.zip",
            checksum: "d29e9c99a32701b644809c56564d130de1d20756494b838dfa7efd4c6bb391ce"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATOguryAdapter.zip",
            checksum: "4b95797ed14de5d39db88c01462f95394c1432983b2d81c322278d9ec734470a"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATUTIQAdapter.zip",
            checksum: "08ed90f0d65912c43bb8c56563451de3f216d42e158cbbc91e3a5ed6372acdc8"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATYOCAdapter.zip",
            checksum: "ee0503b35914e0e7ea1a38a89481cb479714853c5a7f09a9075dc90f70911de9"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATKit.zip",
            checksum: "36e5eaf29ec98b1112b19f42fd922f687805aa52caa39d448a05992c07b622fa"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATTappxAdapter.zip",
            checksum: "0d74a7dad98854c29237bc26a7a35618dc31523c89f62d01bef7cf44f8d29720"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAppLovinAdapter.zip",
            checksum: "4d17fe2e2a7aa5eaf3aab3b2a48c345234b5f5e952928d4ada9051f4fc05fccf"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAppHarbrAdapter.zip",
            checksum: "9934120955622ab7bbcbee73e50f4f90e4143a0d50f6a6c132a20547b63c7f6c"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATTeadsAdapter.zip",
            checksum: "3f58c9fa47d041a16c3089ff9f5070f5f12d55ac5eeb477f3031f3c9548c1568"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AppConsent.zip",
            checksum: "24d32ebbac72577af10a1d774dc35c6d60da0620a7d2813b85ef92cc9d98401d"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/UnityAds.zip",
            checksum: "b9a9a37688f26348b32db1e2d7470b46769a5dc1ff03cc5e52d9a1468d0ea15b"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OguryCore.zip",
            checksum: "389b35c333eb1ffb92988f8160cc2fc005d4dc3c2e5b866c80adff89397930b3"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OMSDK_Ogury.zip",
            checksum: "d6b5eeeb30df3fcd2e3ff176fbed1fb1f0b00ff7d63a61d167cd5f1c517fab26"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OguryAds.zip",
            checksum: "d5f97e1299b6da46b7579241a02a261b17d168f5b67557f972e05103e3fba6a1"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/InMobiSDK.zip",
            checksum: "2a10bd57f25c90adf0949fad3d70e7792104dc085ec58529e87b202ebf5f46f2"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/TeadsSDK.zip",
            checksum: "5483844ad714a611dc4786aaeecda89c6165631a232ca9ef2089897f329866ae"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OMSDK_Teadstv.zip",
            checksum: "34adf6b91bc3f5e3cd6494f483b3c1836cd4e8c3b938e9f17f3a9adf587b54b1"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OgurySdk.zip",
            checksum: "5525eaee67a79d59445d6910733c0b890fbdfe5634757755da88f237563a546b"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/FBAudienceNetwork.zip",
            checksum: "3f18e0c15646b4f092bf166c16adb1b2dfd25b58ccbf38836cfa17e369e467b0"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/TappxFramework.zip",
            checksum: "537f71b704c32ae2222d454e489a7fbc18f28298940ac287bd95ad14ea7af7bc"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OMSDK_Tappx.zip",
            checksum: "5de5444a032986b0369f6498fffc0c04ff578d050ee0dd6265683ff0961b9992"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/VungleAdsSDK.zip",
            checksum: "57c002d633c41be740fec15a301f6f559bc38c2883fde4e749e436cd23ad6b71"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/IronSourceAdQualitySDK.zip",
            checksum: "b0493c416ed3fb79af120c8880200fa7c8b5c7ddb5388930c52d47418239b82c"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/DTBiOSSDK.zip",
            checksum: "3ca0722292dc9067cbf93557122b7afafce0a7dfb307aa9d4b1fe24542af9296"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/KidozSDK.zip",
            checksum: "1b2a1dbc3ec897ec86f99daa51cce64d9a973b2c7876e00da2c462a51d4cd873"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/FeedAd.zip",
            checksum: "cfde28aed3e53714c832f918bbda360ec8f2a522e31fc9b33a4ee12a151f03ac"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKInterstitialVideo.zip",
            checksum: "706f5231c022508c66c30a681915b5a389416bb74063f700424c7b839b4d1631"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKBanner.zip",
            checksum: "4ed902e4200c523ad3c0fae759c1ae7d10346db16890694f93078972984691cb"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKBidding.zip",
            checksum: "93abe9ff2b690c30c6c3153293a081b2e0e5cd3c0191b14aff33ae93a99fb70a"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKReward.zip",
            checksum: "73e3678bd13ba1082c605a306313f8d6dead8c9ec737d8dafdd247ad75a30eb7"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKNativeAdvanced.zip",
            checksum: "c54809510c57249bd62a70550cae673f1a7c0abd83bc2268d5c6af619f7fe2d8"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKSplash.zip",
            checksum: "5238dc0f9a7ab23bcd3b49f042625f543c27b41daf61f2d9129458bf74c96359"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKNewInterstitial.zip",
            checksum: "f89f89142ece72e056e18be508b5207145832b4cc2f69e84f55a508e315825c7"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDK.zip",
            checksum: "36d1d409ab09c1756c32ba24d8b06c2cf7867e4abea39615076a74745f59b7e7"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/IronSource.zip",
            checksum: "b47031301e18c01d5ef6b9d6dd1261dd2ae4d0136a11eedb4e819653b5e8b278"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MolocoSDK.zip",
            checksum: "eed29d829201e09d68a30fac330f2cdf8f5b55238c230a0dc7a5677e405d7f25"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AppNexusSDK.zip",
            checksum: "70c3c9a0f940d880c4d2a22273bd6b7b79f315e9a50cdff21d43bedf93022f28"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/SASDisplayKit.zip",
            checksum: "e87c401489a2e408e745c0d2d355b67301d710f37b78007f9d578a67dc5994e1"
        ),
    ]
)
