// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "3.14.0"
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
        .package(url: "https://github.com/AddApptr/RTBSPM.git", exact: Version(1, 7, 0))
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAmazonAdapter.zip",
            checksum: "b06e375e39fdb56f560d9f4e0bf98f9690792de53acebe6df1ccf17dd932b36d"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATUnityAdapter.zip",
            checksum: "4d9c0ba3b81d0a071e822d3b5b3f29d389d07d161ae9b366f7c770dfebae5467"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAppNexusAdapter.zip",
            checksum: "ecd00f8f93f736a9b596140c85745e0701cafd232539960ea88f2bbf4a0b9f4c"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATSmartAdAdapter.zip",
            checksum: "8ffd622449706eb02b76541c2b1698b8645f3de1c2eda06e12bf38f176081529"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATIronSourceAdapter.zip",
            checksum: "7574e1c624621feeba9a2662b2b254a4411643587bff92a316389736f73debd9"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATDFPPrebidAdapter.zip",
            checksum: "031cd5cdb301c00d360ec9f4c612783e807fdde162e27fb22351c8325030152b"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATGraviteRTBAdapter.zip",
            checksum: "32659bc4d60f270c3cfbbd2797a35ad9dde128f515aba418ca1893191a7c84d3"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/DIOSDK.zip",
            checksum: "25e542baa8a10f8f45893ca94443adad87e18977fffcb3d3e872be03c8410d07"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/ConsentViewController.zip",
            checksum: "bc9ade33c3a1d852f83a225640d42986cc5e3f3f13936d01887e427259167bbe"
        ),
        .binaryTarget(
            name: "AATSPMobileCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/SPMobileCore.zip",
            checksum: "e90eb864fb27b2752ceb4cd8f68bf4c5cfd6a6d8bcc5abb1a1b82bbc3d9420ef"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/HyBid.zip",
            checksum: "efb8d3acadfffc2c0f3f2a6224b9970b47b86306d21b302d74ebee2df74f3927"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OMSDK_Pubnativenet.zip",
            checksum: "b6b063c0f49378e2ffb23e6d4b658ffce4094d4e0a3dd11f12f3187488a4dcc1"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/ATOM.zip",
            checksum: "f60cb3cd941fe8ad887f9e655584681b4b9da7d9d93c1f4a736ee0b72b4dfb75"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/VisxSDK.zip",
            checksum: "7acf64d1bbf1c0be14b37a0da6993d07e347bed681c626a3cf721de3ced892ac"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/Utiq.zip",
            checksum: "72c2cfd82dff15e4a26dcea8fb1d06a7fe4da1d1e7287392cb900b1a1b942a55"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/PrebidMobile.zip",
            checksum: "5ea6564a1839b5f384583ac53f861c5385740605c6b9640eb056e119443e1732"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATSourcePointCMPAdapter.zip",
            checksum: "a9c312e8ac582b1d0eb2cf750db602c714c3bcfc22d42575b068504d2af668e6"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAdMobDSPAdapter.zip",
            checksum: "62e4340c99e89c7022c65507abbec150e1a0350450b328a84163d6c5eb7627e3"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATSuperAwesomeAdapter.zip",
            checksum: "570d985e7e6ccbabdf876654bac4e3b256b7d6c2952bdf38a6fb46129251abdb"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATGoogleAdsAdapter.zip",
            checksum: "6d02cbbe783bd211cc2026a67ddf39a7a25ddde897dac26cffd7175dffb42598"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATDisplayIOAdapter.zip",
            checksum: "8cda2ba8dd348bd343e183c701d95aa57bd3349836a1bc925b332f3b36220a36"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATPubNativeAdapter.zip",
            checksum: "89dd3b6d239d65c9f14c020f6b00e490107ec333a44f51b086e94ad27296fcab"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATMetaBiddingAdapter.zip",
            checksum: "a9cc05d431fde0f063ca47a2e010f821dce627c76b63908e80b6ff40d88f8d25"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATVungleAdapter.zip",
            checksum: "d87e095b845bc6c5ec64f4872f2c06aeafd7db822a44ccbc51f801c7b78756f2"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATFacebookAdapter.zip",
            checksum: "2fed05f2c1b0e0cfeb5f67f9d1cc849f01e72aec4e021a0589a5069f750a5b6e"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATFeedAdAdapter.zip",
            checksum: "e8c55c5ab843f6bf749ce7be9cad3dc7846e14680bdb5a50e8eabc701820c51b"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATMintegralAdapter.zip",
            checksum: "a5a5e92656dfd3a95d15386d49e556774e1eca950ef2835fe60c8de7482b5ac9"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATKidozAdapter.zip",
            checksum: "ab2ae6d04e1bf6081be1602b3c98074db81cbe8a572b61b1e7d23ec5e74c552f"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATGoogleCMPAdapter.zip",
            checksum: "f4b28be2a0d5d417a3133da5cc13d5611c5e456362f7b695866ec49478c64ed6"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAppConsentAdapter.zip",
            checksum: "0c08a6cc5bf76bd505809a061efeb0674c67de8bebb26e2d87cc3e6fcb93a453"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAdMobMediationAdapter.zip",
            checksum: "8a7128037a1191b5b525a57cf9d6745a6debb55bfe81a9158226decf5bb6d168"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATInMobiAdapter.zip",
            checksum: "cb9a2bec3143b15450162b71d7873cf323256e8ac3c8792040a89f0974336932"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATOguryAdapter.zip",
            checksum: "6d3f8efdd36ef365ab4ec8b18c5f3611f0116ee7be7942509d3704cfbff0a59f"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATUTIQAdapter.zip",
            checksum: "dec79ea9926b59b914a47f1c8a98a7013d7d582ec8b4b74312e6674af3962887"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATYOCAdapter.zip",
            checksum: "5aaf61af3ff4b9d2af41f959113fc039648786487249b41b54b68ff427cc1db8"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATKit.zip",
            checksum: "daaa1715806257a675b891e5bcd562c8938c68cf3f8ea761ed6ca4c28d7c00fe"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATTappxAdapter.zip",
            checksum: "0a1cba3be5dcf42fba6584d49abc6650650992317b64e55a0de82ceffae2a035"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAppLovinAdapter.zip",
            checksum: "0e21190e384fc063dc2c0013c744ca5779ca6fcf766706a3b24041a3bcbd83b2"
        ),
        .binaryTarget(
            name: "AATCriteoAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATCriteoAdapter.zip",
            checksum: "59564391243ecaf3b1101405a38d68231d26e3f67f7037312de407ed9f3ab5d4"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAppHarbrAdapter.zip",
            checksum: "be57f15b79f4b5f7933328b4c0f84df788e2b313f8ff7856fea1ea117f9f99dd"
        ),
        .binaryTarget(
            name: "AATSmaatoAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATSmaatoAdapter.zip",
            checksum: "725eb9c52fbdbcc131ca64a3f0b6ef9c8f959b2b31cb0051a4c4f9713cfa501d"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATTeadsAdapter.zip",
            checksum: "c17168ecd28d429d8b1949fa91d1325299ed615b372b16ef71be900f36e71059"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AppConsent.zip",
            checksum: "0fa3da519e8643e3b076d3464e89b408ce8d81b42fd863b560c866fd363c39de"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/UnityAds.zip",
            checksum: "ab8a518f3cbc288bc8e422bd9a66963d7df8051159d82beb5735f45f87e2280d"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OguryCore.zip",
            checksum: "39e4ba6038d149d602cf60e74afc72857fe40ef555d7e25d6029c6a383228268"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OMSDK_Ogury.zip",
            checksum: "6fd1bc9e6eee8822f098906b823db17c554dc79e14185571c0d09e72ca4387a3"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OguryAds.zip",
            checksum: "15388a2489c8617307bb7803fe066b2fb373ea7c27cc96fbb88d1c51057a43ae"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/InMobiSDK.zip",
            checksum: "a32e5bf87e8062b20960162470e5a028e1d01e408f18dea712a9097b5d45a2d5"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/TeadsSDK.zip",
            checksum: "a6d76177546b9c3bf4556159ae0291d9192c05af51dd8ada82800abf3f01fdd7"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OMSDK_Teadstv.zip",
            checksum: "d2f8648d9e0ea8cf06d39539d9cb243aaeda7e00f8b8bb1e1b044a7512cf601f"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OgurySdk.zip",
            checksum: "b7b12830a7b9c6b4a6b09d1671deaa1fb1eedd5b093ea7703273d8ad7a7e9641"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/FBAudienceNetwork.zip",
            checksum: "f01767ad75ec8834abb1e4b36742bf2724533d5d88e9600bbaa34fd85e7c72d6"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/TappxFramework.zip",
            checksum: "7d2e1adb8685eec8587c10ca1f00e39da14b323e1c9c32f936af99ca2c0b6492"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OMSDK_Tappx.zip",
            checksum: "7f09a17be9c205cbf2de429c1276a4c8bd6d3f52bf42cdeb546b27103decfb18"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/VungleAdsSDK.zip",
            checksum: "d1bfb2aa9da05eca270d7627dd5e2033d18b95f5af62df4184635671973c4628"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/IronSourceAdQualitySDK.zip",
            checksum: "ee780a4088384ada3b73f2446864a9b3005d76b451a9638726a8ba3a7caa888e"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/DTBiOSSDK.zip",
            checksum: "b50c9385dc14ea63e3f3fe57261860b221e343c1d7e9da1b1c0b7dee84c66a21"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/KidozSDK.zip",
            checksum: "13e3b956b168aee6191bcd3837e259cc870034e7650060b3064efd27004175a3"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/FeedAd.zip",
            checksum: "20a1ee16219e0605a7181c209d7d5bbf9f19050b39992ea6139e60096e97d769"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKInterstitialVideo.zip",
            checksum: "56faf305b77b351ac492d955461281aab1bcb10cef919c1af91db2e952dc6c77"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKBanner.zip",
            checksum: "bf54378028ddb21a7fa00622085111dec3a2ec07c8e17d22b2c68a813c36f8cb"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKBidding.zip",
            checksum: "79acd35355debbb669125f457a48358d754823f7d6df29db9ac4f51f03faa014"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKReward.zip",
            checksum: "e6a585af65fc45a2ddb719bb27cb482c664d434caca6b477ceccd0705e4da6f1"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKNativeAdvanced.zip",
            checksum: "bb63b2882813c8eb415a40fa3972b558631b917c708a5aebdd98e942726f0079"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKSplash.zip",
            checksum: "0479959807ed4d6126f0eda66840e1ea72701ac2bafa3e10a6ddc32f86937931"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKNewInterstitial.zip",
            checksum: "1b6991bee5fbc2c7e91378cd66f730078dadf85dae87b17588e179b18c152c55"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDK.zip",
            checksum: "ab3cba0a2b8f778c9f443bf528c2aa21a54e3af4904015958f6fbbe81e2499d3"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/IronSource.zip",
            checksum: "fbf561a1de8f21f4f4bffbfb193f162e33340afc3c11de65370d4f82e2373e5d"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MolocoSDK.zip",
            checksum: "2824f0b4d0971d7c803e0306546f58ededee059e085d4e5eccd7ee097e9bd9b2"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AppNexusSDK.zip",
            checksum: "93ed68792c2b826646c2e54694c6148e1a8502368733792009b1f70d99015633"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/SASDisplayKit.zip",
            checksum: "ba3c69d03c4940e6853fd730cbafb3d9283470029388104defaade26b27f4b3f"
        ),
    ]
)
