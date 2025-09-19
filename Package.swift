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
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: Version(12, 7, 0)),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", exact: Version(1, 24, 1)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSPM.git", exact: Version(1, 8, 0))
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATAmazonAdapter.zip",
            checksum: "b0ce466ac713254711fff7cb848ace0ab3113df8cd5f318a5a70a54b85cf54e6"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATUnityAdapter.zip",
            checksum: "878a13dc99f5142ceb0395f827d84abe574d0a086ea09213b64df23d5af1c62a"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATAppNexusAdapter.zip",
            checksum: "fbe849a6d6ac9b0ab71e1429e3b789eb27f3f20bd5f1fb18184fb413b10296e7"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATSmartAdAdapter.zip",
            checksum: "a79b940d4a3eadf5595c06c7ed6f6129a6cc39f6dbb7ac10fb8acfd5d6c98714"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATIronSourceAdapter.zip",
            checksum: "850743733bd25352c1d39e8f737dc24de7e21372018a9a8ef71ad444a098137e"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATDFPPrebidAdapter.zip",
            checksum: "8729e73de2e6816c6650f5e15152967905c0e246ef8bb27116e8338df87a48d0"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATGraviteRTBAdapter.zip",
            checksum: "2e6a7f96e2a1f87ffbb39a28b16bcf5951719d918b39527acb51359ecfef199b"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/ConsentViewController.zip",
            checksum: "2aae374099a8ff9f2109c84bb3bbcba05d646bb42ad0696b11df7fb19d134aee"
        ),
        .binaryTarget(
            name: "AATSPMobileCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/SPMobileCore.zip",
            checksum: "5487f84af7958d9b97f1010b87757fe7660f6171b8e0b3461ebcab9df6b9f795"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/HyBid.zip",
            checksum: "26e989fc4b242d0a8abd7a555a44d6f97bb48d82661c6f87c215e6c25f68135f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/OMSDK_Pubnativenet.zip",
            checksum: "ac3913d3a32a9c59ae199f4e8bcbff3b30902244bec3320948904b7096500a35"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/ATOM.zip",
            checksum: "85a3b24050388e49f194e4f3e9832e7289d5a69b2bef9dab1158844d02681c37"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/VisxSDK.zip",
            checksum: "48e4c136eb9be9cf1bc0ec0bf9f5482d1c2a140fe95df5ba5ea3fb1946d81a2c"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/DIOSDK.zip",
            checksum: "d4710d450bbc44afe18a8f1abcbb89b5b0a35aea1f4b668f260dd151a5e5dca5"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/Utiq.zip",
            checksum: "54f784d1997f83030279e2851457fd62accaa19a41443e2b477e4a8bb7277d8a"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/PrebidMobile.zip",
            checksum: "fd14fda6d786286a46fa746b924e7f48e85f54723c70fce1346517c466c8df9a"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATSourcePointCMPAdapter.zip",
            checksum: "b8f2c39d3449f39cf15ad5de3d97d77d2568918fe76b45a733b43b8b99a4e717"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATAdMobDSPAdapter.zip",
            checksum: "596cc242dc312cefe33c5b86583f149df2a2acc2fe048ac719fca38ba98d31e0"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATSuperAwesomeAdapter.zip",
            checksum: "b3b25454e57c9b1244d111843538da0b5da3263efbadd600b4168c5318e52897"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATGoogleAdsAdapter.zip",
            checksum: "f6cc53a26bdbce0cbed69e45606c707bb0b5973cb91755a857bb646d1ca8e23e"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATDisplayIOAdapter.zip",
            checksum: "363cad20edcabe28dd3121d439e480d381dbfbdf9a25011d7d146c1674791aa3"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATPubNativeAdapter.zip",
            checksum: "bb198cae99896e7247598189fc734ad4b0ad374a4c43a705d55876e32b63095d"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATMetaBiddingAdapter.zip",
            checksum: "5cf09574ad3f62892d63771de67a041b3d88a4535a87ba25c0665f89daad04cc"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATVungleAdapter.zip",
            checksum: "bad6db39307a1bef3108e5ed5f501bd9261aa68cd7bddd9a0289ab39f1f47c71"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATFacebookAdapter.zip",
            checksum: "5a1cd38d5f7265f11dd4e97609a645ffd64da7679638d3d6730f9c2ba7abb4f9"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATFeedAdAdapter.zip",
            checksum: "7cb48ac6d8ff3d32e975ddd64461206fe9f43bb0d63b6b39d7d3a67f8bf26528"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATMintegralAdapter.zip",
            checksum: "370c19fe0d4a874452c97b9ee881ba9fb9807925c0cf2909cc126cacfcb3620d"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATKidozAdapter.zip",
            checksum: "3b7b4bdc96ef8506338c7621d469d5cd8484c1a8af3af16f61d98df022c5a8be"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATGoogleCMPAdapter.zip",
            checksum: "1e30c279506bb807f4d257c1da1a779f5c6432ee7845bb5fbdfc9fc9832855e4"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATAppConsentAdapter.zip",
            checksum: "08671f65fc0698542a9b90d754afedf657d5ab15a1dcf8ed35549a3ad7967001"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATMolocoBiddingDSPAdapter.zip",
            checksum: "5b730df9825ca40f03213f59831f3273f8d7f83749a9fad4d89c8fbba4486d33"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATAdMobMediationAdapter.zip",
            checksum: "643c1b1d1a1386b398d19beabab7b7dccb905947e61ed494241bd3f65860c913"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATInMobiAdapter.zip",
            checksum: "1206418340a66702600ba62b62441657f7c26be87f2a5c09177dd92108439c14"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATOguryAdapter.zip",
            checksum: "f11e1857fe98ed521fa1e9dafcfcf901ae8ef936f232eeab7ae49e85c4594e52"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATUTIQAdapter.zip",
            checksum: "67e528a169c38e5dd6394db812dca7e399e5283732d964c1b1e9a5be0f0ecef3"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATYOCAdapter.zip",
            checksum: "2fbaa19d1292f8598eff171850aeaaae82a3d2e93749ed2525b9814dba9b4607"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATKit.zip",
            checksum: "eedc984a6f3957e13fc3bd1a5a6f183b3cf1018aa3a11b7012260b68a84df2a8"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATTappxAdapter.zip",
            checksum: "ef34aa07f8ccc05a162950717662f8a04921cdfa6bfd05eed2833a5957ab1420"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATAppLovinAdapter.zip",
            checksum: "442f8ad8e08cd34ae5e974f7ee32c9304f4bb95ba9c8f6d2e8af55f3e6fa18e6"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATAppHarbrAdapter.zip",
            checksum: "d0ce2a8891087928e01d5d8905729a408055ecec7fda657ecdad0d51bea56c93"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AATTeadsAdapter.zip",
            checksum: "38a3ea40c441377d259979a12d7cf5274c98f7024e8ef7df36f3958e95e17ed2"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AppConsent.zip",
            checksum: "06bf794d8824a01bfd4d76061e183bdeec8a5ea7433a3dae2216f98883e63848"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/UnityAds.zip",
            checksum: "9b010cb6f8d5fba2cc922ec64bf2792b2c784291fb5c49a96bd88e844c777eca"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/OguryCore.zip",
            checksum: "87509b2c92b674c9470b2cc7eb63286263c160086dec65f91e07fb183969c04e"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/OMSDK_Ogury.zip",
            checksum: "aa7ffa653de5b428ebb5529e4671a71f6cf6cc3482ce1ac4c651a0700b3c9fa2"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/OguryAds.zip",
            checksum: "82c6e84d2026dea5931eea3afbe5ab7ede347f7d9f90e69e57297e232a76ec98"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/InMobiSDK.zip",
            checksum: "773c8dff2f450c9593908109471c6ca5c350c492c61d055957d218d72cbffbde"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/TeadsSDK.zip",
            checksum: "bd209bc1318d4f9018d6cbde4d6e70ac3f45c322009b8886885652c66208826b"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/OMSDK_Teadstv.zip",
            checksum: "d0b52fb7437ade703a16d7d731b5882c5d00b31704593dc6c924cd00424e12d4"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/OgurySdk.zip",
            checksum: "63ac94ec2ba8250679f815c7b64757803c2065c5d4edf5166d6c253aed320035"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/FBAudienceNetwork.zip",
            checksum: "6bd9ae6fb2f479a17e9ec4f9ae82bc9ddaf0ffbd734f5f25cfc24746b242b8e9"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/TappxFramework.zip",
            checksum: "ca3cadcca0fed701e53d10278693403510078d4b9e4a01387f425af18d65cd67"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/OMSDK_Tappx.zip",
            checksum: "6f653bbd1ceeedc680dc9ec2075c1d15509f4084061d7dccc5a2daaae5121aca"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/VungleAdsSDK.zip",
            checksum: "d1ebf4ab67cd4c12c30559ad76c7779338d217deee644235e68d8779a718083c"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/IronSourceAdQualitySDK.zip",
            checksum: "67cbe9b83b4dfcc4032e0097ed1764f769e6e5d0e82de6fa45b8aee6251954ce"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/DTBiOSSDK.zip",
            checksum: "70889b94f2f729d49d0de683c1dae4250ad9193a0f863db5c301809a60330752"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/KidozSDK.zip",
            checksum: "6a6e66b03b03e845691d526071ccf4c2191b87f6433382ee190631ea13643d59"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/FeedAd.zip",
            checksum: "7b88fbdb7408c4ee24f3e2d270134d084f211ee8d1cdc09a1f54a0450d05978f"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/MTGSDKInterstitialVideo.zip",
            checksum: "ba14e8a8891127b2506c495ee6f1438ff70f1e3cfa9db416836a858d4fc32651"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/MTGSDKBanner.zip",
            checksum: "53b59196749edbf82658bd3dc689b04d3b99f719ccb9be85cf55680a69ffa632"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/MTGSDKBidding.zip",
            checksum: "5d1915ea49359fc89f7d0fa7918424f56c34a5667ba679ae2456eb7eb2a25ad6"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/MTGSDKReward.zip",
            checksum: "80b089d5fd80d30a7331f424cf2771a66ba1086d4543a1e9c231917fe9bcb5c1"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/MTGSDKNativeAdvanced.zip",
            checksum: "be954475a0638f05bf1b47b172f66e60b32f7e3d3452442c621dcb9570622aad"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/MTGSDKSplash.zip",
            checksum: "df28d203dafc83fad84ba3f54a9a109d564d3a07de07a6385781dec5e9639ea5"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/MTGSDKNewInterstitial.zip",
            checksum: "180ca469f100e9b46c4bc1860ac3b432dba398ba16e51b26d52dbd0dc5e808d4"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/MTGSDK.zip",
            checksum: "fb4cd418aecdec7f2c1d129bd9368bdb7fa3e324733a03a4a1143a97ab913149"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/IronSource.zip",
            checksum: "3d20ed78124f60a8d3ece040bbda4dfd9d4157623648c12e1eec500f26308366"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/MolocoSDK.zip",
            checksum: "29cc3092c47e9b2b250c81d5877fed9eda2b1a7b850fa10a356fd74955b7005c"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/AppNexusSDK.zip",
            checksum: "e82e7a56eb03255328e9f1118a3738d207cf194a9f9deeeeefb2d8a301e31fb6"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.7/SASDisplayKit.zip",
            checksum: "1fc84dbf7b119127629bb70d127198a3426958ae10be94616febbb25b8bfef77"
        ),
    ]
)
