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
                    .product(name: "AATGoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    "AATKit", "AATKit-GraviteRTB",
                    "AATAdMobDSPAdapter"
                ],
                path: "./Sources/GooglePartnerBiddingSources"),

        // MARK - Dependencies Targets
        .target(name: "AATKit-GoogleMobileAds",
                dependencies: [
                    .product(name: "AATGoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    "AATGoogleAdsAdapter",
                ],
                path: "./Sources/GoogleMobileAdsSources"),

            .target(name: "AATKit-AppLovin",
                    dependencies: [
                        .product(name: "AATAppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                        "AATAppLovinAdapter"
                    ],
                    path: "./Sources/AppLovinSources"),

            .target(name:"AATKit-AppHarbr",
                    dependencies: [
                        .product(name: "AATAppHarbrSDK", package: "AppHarbrSDK"),
                        "AATAppHarbrAdapter"
                    ],
                    path: "./Sources/AppHarbr"),

            .target(name:"AATKit-AppNexus",
                    dependencies: ["AATAppNexusSDK", "AATOMSDK_Microsoft", "AATAppNexusAdapter"],
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
                        "FBAudienceNetwork",
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAmazonAdapter.zip",
            checksum: "b06e375e39fdb56f560d9f4e0bf98f9690792de53acebe6df1ccf17dd932b36d"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATUnityAdapter.zip",
            checksum: "4d9c0ba3b81d0a071e822d3b5b3f29d389d07d161ae9b366f7c770dfebae5467"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAppNexusAdapter.zip",
            checksum: "ecd00f8f93f736a9b596140c85745e0701cafd232539960ea88f2bbf4a0b9f4c"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATSmartAdAdapter.zip",
            checksum: "8ffd622449706eb02b76541c2b1698b8645f3de1c2eda06e12bf38f176081529"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATIronSourceAdapter.zip",
            checksum: "7574e1c624621feeba9a2662b2b254a4411643587bff92a316389736f73debd9"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATDFPPrebidAdapter.zip",
            checksum: "031cd5cdb301c00d360ec9f4c612783e807fdde162e27fb22351c8325030152b"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATGraviteRTBAdapter.zip",
            checksum: "32659bc4d60f270c3cfbbd2797a35ad9dde128f515aba418ca1893191a7c84d3"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/DIOSDK.zip",
            checksum: "25e542baa8a10f8f45893ca94443adad87e18977fffcb3d3e872be03c8410d07"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/ConsentViewController.zip",
            checksum: "bc9ade33c3a1d852f83a225640d42986cc5e3f3f13936d01887e427259167bbe"
        ),
        .binaryTarget(
            name: "AATSPMobileCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/SPMobileCore.zip",
            checksum: "e90eb864fb27b2752ceb4cd8f68bf4c5cfd6a6d8bcc5abb1a1b82bbc3d9420ef"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/HyBid.zip",
            checksum: "efb8d3acadfffc2c0f3f2a6224b9970b47b86306d21b302d74ebee2df74f3927"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OMSDK_Pubnativenet.zip",
            checksum: "b6b063c0f49378e2ffb23e6d4b658ffce4094d4e0a3dd11f12f3187488a4dcc1"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/ATOM.zip",
            checksum: "f60cb3cd941fe8ad887f9e655584681b4b9da7d9d93c1f4a736ee0b72b4dfb75"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/VisxSDK.zip",
            checksum: "7acf64d1bbf1c0be14b37a0da6993d07e347bed681c626a3cf721de3ced892ac"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/Utiq.zip",
            checksum: "72c2cfd82dff15e4a26dcea8fb1d06a7fe4da1d1e7287392cb900b1a1b942a55"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/PrebidMobile.zip",
            checksum: "5ea6564a1839b5f384583ac53f861c5385740605c6b9640eb056e119443e1732"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATSourcePointCMPAdapter.zip",
            checksum: "a9c312e8ac582b1d0eb2cf750db602c714c3bcfc22d42575b068504d2af668e6"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAdMobDSPAdapter.zip",
            checksum: "62e4340c99e89c7022c65507abbec150e1a0350450b328a84163d6c5eb7627e3"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATSuperAwesomeAdapter.zip",
            checksum: "570d985e7e6ccbabdf876654bac4e3b256b7d6c2952bdf38a6fb46129251abdb"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATGoogleAdsAdapter.zip",
            checksum: "6d02cbbe783bd211cc2026a67ddf39a7a25ddde897dac26cffd7175dffb42598"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATDisplayIOAdapter.zip",
            checksum: "8cda2ba8dd348bd343e183c701d95aa57bd3349836a1bc925b332f3b36220a36"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATPubNativeAdapter.zip",
            checksum: "89dd3b6d239d65c9f14c020f6b00e490107ec333a44f51b086e94ad27296fcab"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATMetaBiddingAdapter.zip",
            checksum: "a9cc05d431fde0f063ca47a2e010f821dce627c76b63908e80b6ff40d88f8d25"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATVungleAdapter.zip",
            checksum: "d87e095b845bc6c5ec64f4872f2c06aeafd7db822a44ccbc51f801c7b78756f2"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATFacebookAdapter.zip",
            checksum: "2fed05f2c1b0e0cfeb5f67f9d1cc849f01e72aec4e021a0589a5069f750a5b6e"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATFeedAdAdapter.zip",
            checksum: "e8c55c5ab843f6bf749ce7be9cad3dc7846e14680bdb5a50e8eabc701820c51b"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATMintegralAdapter.zip",
            checksum: "a5a5e92656dfd3a95d15386d49e556774e1eca950ef2835fe60c8de7482b5ac9"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATKidozAdapter.zip",
            checksum: "ab2ae6d04e1bf6081be1602b3c98074db81cbe8a572b61b1e7d23ec5e74c552f"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATGoogleCMPAdapter.zip",
            checksum: "f4b28be2a0d5d417a3133da5cc13d5611c5e456362f7b695866ec49478c64ed6"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAppConsentAdapter.zip",
            checksum: "0c08a6cc5bf76bd505809a061efeb0674c67de8bebb26e2d87cc3e6fcb93a453"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAdMobMediationAdapter.zip",
            checksum: "8a7128037a1191b5b525a57cf9d6745a6debb55bfe81a9158226decf5bb6d168"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATInMobiAdapter.zip",
            checksum: "cb9a2bec3143b15450162b71d7873cf323256e8ac3c8792040a89f0974336932"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATOguryAdapter.zip",
            checksum: "6d3f8efdd36ef365ab4ec8b18c5f3611f0116ee7be7942509d3704cfbff0a59f"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATUTIQAdapter.zip",
            checksum: "dec79ea9926b59b914a47f1c8a98a7013d7d582ec8b4b74312e6674af3962887"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATYOCAdapter.zip",
            checksum: "5aaf61af3ff4b9d2af41f959113fc039648786487249b41b54b68ff427cc1db8"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATKit.zip",
            checksum: "daaa1715806257a675b891e5bcd562c8938c68cf3f8ea761ed6ca4c28d7c00fe"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATTappxAdapter.zip",
            checksum: "0a1cba3be5dcf42fba6584d49abc6650650992317b64e55a0de82ceffae2a035"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAppLovinAdapter.zip",
            checksum: "0e21190e384fc063dc2c0013c744ca5779ca6fcf766706a3b24041a3bcbd83b2"
        ),
        .binaryTarget(
            name: "AATCriteoAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATCriteoAdapter.zip",
            checksum: "59564391243ecaf3b1101405a38d68231d26e3f67f7037312de407ed9f3ab5d4"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATAppHarbrAdapter.zip",
            checksum: "be57f15b79f4b5f7933328b4c0f84df788e2b313f8ff7856fea1ea117f9f99dd"
        ),
        .binaryTarget(
            name: "AATSmaatoAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATSmaatoAdapter.zip",
            checksum: "725eb9c52fbdbcc131ca64a3f0b6ef9c8f959b2b31cb0051a4c4f9713cfa501d"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AATTeadsAdapter.zip",
            checksum: "c17168ecd28d429d8b1949fa91d1325299ed615b372b16ef71be900f36e71059"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AppConsent.zip",
            checksum: "5ec957ea71157ce968731baad8e9502c8e75140295ea580118289765f60fab20"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/UnityAds.zip",
            checksum: "26060b2ecd1f587f4ef4a567caf721a25f9daac723eead9573e56506d89984ab"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OguryCore.zip",
            checksum: "3fab94de4db266aae7fa28195dca555b7af0059db9c3a05c89d560b15b77768f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OMSDK_Ogury.zip",
            checksum: "ffe0e251f5b84df12024aa80f9f9476bf9ac818baccb16837ae85f51b17f3c67"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OguryAds.zip",
            checksum: "46a485f144265f2b2e7b6c37b832af5e6170b61853571979dc6001e7dbbadd15"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/InMobiSDK.zip",
            checksum: "b808b540a9edfe70d9fe05b9b1d8fa89d5a9fe25e22b55174caa82fb891dafc4"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/TeadsSDK.zip",
            checksum: "2cd64957286b9b585a8ad263c5336b689f7437bd1dd6d7b6c4fc0a343289a0b4"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OMSDK_Teadstv.zip",
            checksum: "1099be3a5cacff0ebb788f37eaf40d61286560900ea7463aaad0442a2db00213"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OgurySdk.zip",
            checksum: "624dbd07213ac786362ed58d38742e471d284cb1cecd0608b29a05e9184e936c"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/FBAudienceNetwork.zip",
            checksum: "307d913d17789e3784963b9a84060910c1c5fcd557b84eb7c9e272dad0627f18"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/TappxFramework.zip",
            checksum: "2f05cecde660a4a20165f95c9a4efd5411081d25593d845abea8e1efccd36862"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/OMSDK_Tappx.zip",
            checksum: "33467cde1e423a92fc1aae890814cc77dc183d8c6d084974ef5b091f02a88ad9"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/VungleAdsSDK.zip",
            checksum: "c83abeb9d900ac62ec54b13f6c3810114170ce71d584cf935df76ff55ceaadcb"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/IronSourceAdQualitySDK.zip",
            checksum: "50bd09395f524ea263ddce2146aae3be34152d33428897ccf7e29b357452b5d9"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/DTBiOSSDK.zip",
            checksum: "641e22728aece456731638da42772abcf08a293a187880c31158c8f37a98a196"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/KidozSDK.zip",
            checksum: "879dbc3cdf3c0c22eb5cebe68a8e2239d6f9af52469f658c8ba272374d4b17a2"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/FeedAd.zip",
            checksum: "219711cf724549914a1aeb9c937ec75170abc1f1ed68708b292af244bedcd0c3"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKInterstitialVideo.zip",
            checksum: "7aff602df2dcfc14db9f756b38c5527ef8d45a9ff35924023727f9a98aa0682c"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKBanner.zip",
            checksum: "c44c63977a6420d44c7dd55161eceb9c61c3fa5c214cd62c1ffea860eb2f086c"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKBidding.zip",
            checksum: "f7fe3b63af3cb0082ab3a08e98dc7d9544815cb1d882e3588a12a8a8ade47b94"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKReward.zip",
            checksum: "c1e50fb469cc2d84cdfe8e0fa11715a557edfc3658a9249f1d6fd17f44334774"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKNativeAdvanced.zip",
            checksum: "bb63b2882813c8eb415a40fa3972b558631b917c708a5aebdd98e942726f0079"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKSplash.zip",
            checksum: "98178b394aa5cdaf798f4b7ed40727343a0d9435518addb8ba2037db1d9fa0c7"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDKNewInterstitial.zip",
            checksum: "81bccd916d600983c5a8e66b515a16f7a9b13f538fb44debcafc415a61cb284d"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MTGSDK.zip",
            checksum: "d1b860dfeb5a1f6658b228fb0aae124974db6f48254db6fbcb88d101e04bc9c7"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/IronSource.zip",
            checksum: "65204464cd226d6ce1ce9bf6aa2c9ab8d44e762cbac7548b3a795b66c565c92a"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/MolocoSDK.zip",
            checksum: "ec8c875de7faa6b7e63920b603efb9c8dd928b6d8a400986aa3fd0e319c1a537"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/AppNexusSDK.zip",
            checksum: "ded70c243b21a12802d07e465ff2bf6fa4f566111cce60ee13503660d700104a"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.0/SASDisplayKit.zip",
            checksum: "89b0a959e747ce5b92d4eb20943a1ab9fa89a94633c3b7980fe9fd78298a214d"
        ),

    ]
)
