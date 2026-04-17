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
        .package(url: "https://github.com/AddApptr/RTBSDK.git", .upToNextMinor(from: "1.9.4"))
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATAmazonAdapter.zip",
            checksum: "ea0002fba14f6ab851bd5e7a0c6ad8dbe468dd552db06b388ebeaa6eacf31638"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATUnityAdapter.zip",
            checksum: "fa0ebfc55bfc15471efb09121376b5febc11e57666fb6db4429537c367bfc4a5"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATAppNexusAdapter.zip",
            checksum: "1de902759a3c293c4c837cb2f50969b1fe1575623c3772961e557eee7af14463"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATSmartAdAdapter.zip",
            checksum: "3d1d6694202130e72adb591e431891b46f40fbbb70c3025d884cb476f2f35198"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATIronSourceAdapter.zip",
            checksum: "30012735e107901b31e56a9a543824974da7362a49d37d104fcd3d019d505ff6"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATDFPPrebidAdapter.zip",
            checksum: "31f46fe2a6b4af67bd8881fbf257317e89317a821c4b3279a359ef0e32faf3aa"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATGraviteRTBAdapter.zip",
            checksum: "3d4be80a3c204c44cb315801780446e6e3579c72574ee8e519b3daaf0cb62a55"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/DIOSDK.zip",
            checksum: "91ef4eb7be9316dfaeb764fd8f3487e2f871f37618b94b51f19c411aa85f2bbf"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/HyBid.zip",
            checksum: "da4490056e8c80b8e66135bdd10ee60f5afd928fdbe3b8785453569d7e05eec1"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/OMSDK_Pubnativenet.zip",
            checksum: "e1b70fd9d488441d3dc547a9ad348d79b3146a112627bcad10d966010edf8583"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/ATOM.zip",
            checksum: "e78d45a751ef621862ccc2a45b1eb0d8ee15f706b1a4506d85654cf359552b74"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/Utiq.zip",
            checksum: "2fc0999036751d3253d2106ebec3a96d5733eb9d2e4a0084172248f8ee0732b8"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/ConsentViewController.zip",
            checksum: "ed65cde5366cb70d3fc4dc4fc4b51b13ca4edbc5804ae1fca0efb4ef897f11da"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/VisxSDK.zip",
            checksum: "491a7e3b9023177796b1e3bd4cb1cce5eb086ced03eebcab8f55f07474631132"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/OMSDK_Prebidorg.zip",
            checksum: "a65313ae178efce2e532f061e74987c62373ef7c75e3e2c3012e0250ccbdc9db"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/PrebidMobile.zip",
            checksum: "86c156fb9fa5af130fdc2c7ee54c2888ecf8f31e519cfbaf488bef16ecf65373"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATSourcePointCMPAdapter.zip",
            checksum: "69f2f2c33dbc0e500074fa229a987f83c3314a0ddc41d27bb6504739ec5823e9"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATAdMobDSPAdapter.zip",
            checksum: "9dd9cafcb530083486f10de1901987c19529baf22ffb9250585ccf7769b63092"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATSuperAwesomeAdapter.zip",
            checksum: "bb56268c46042e05b55e602bb6934076f7aef8cba789d0793d2024668d12c48e"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATGoogleAdsAdapter.zip",
            checksum: "c035dbd32670e2991ae40ad3056ec1dc0bcbb40ddeadf561b44ea16ef029f50b"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATDisplayIOAdapter.zip",
            checksum: "cc241b1f6e1770f9be5a3fca29534d5ad222dd37479d163da9d65dfaeb98a39e"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATPubNativeAdapter.zip",
            checksum: "22e4ee24d52c6810defa041f0faf22912fa47caca50e53791bf4dbaeb34af04e"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATMetaBiddingAdapter.zip",
            checksum: "ae22be093d906ff6fd9a9a7922d3909a4c2aaae8fdf2b64193d6083123d53d50"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATVungleAdapter.zip",
            checksum: "ba23d4f45320517d45d2d16590642ed4eb88e20db70b06c0f2920e8b733507e8"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATFacebookAdapter.zip",
            checksum: "1d6de6a07d5ffc71f339d431ee05db5b99d9b97193f90aeac6e4d6df7bd8962e"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATFeedAdAdapter.zip",
            checksum: "06d021c74f90b29b5538f8eb6a808c0e6ce0189210bda90c60df9cebc2769169"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATMintegralAdapter.zip",
            checksum: "d8537a1057c57f3892961dda1382daa4f0211592d64da4c92b4d0d7fa888865d"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATKidozAdapter.zip",
            checksum: "b2c65b96a2a980bd8e8b4afd0b14dcf0aa39041fa156c87b24e9a436e398eb09"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATGoogleCMPAdapter.zip",
            checksum: "e042fbf1cc5d10a4a170c78cddc2c5aca4afcfc94decd50ac005fd045b8d7116"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATAppConsentAdapter.zip",
            checksum: "70980f6df39ce58cc7b1de1207d612e71d569376fac1783e7a3dd11327fb585c"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATMolocoBiddingDSPAdapter.zip",
            checksum: "b8a3554ac9389649746a82c7e1366ac3540ae060b2c2c8608df06486a7baa0c2"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATAdMobMediationAdapter.zip",
            checksum: "131cb3645424f65f3348ae39be81592a7df538fe3516efacb868d7ee8e9eed83"
        ),
        .binaryTarget(
            name: "AATVungleBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATVungleBiddingAdapter.zip",
            checksum: "786f678b327568f8dcbfa7e6a59f7e0d983f4c85c2e109b21c9b3b89aad7eb15"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATInMobiAdapter.zip",
            checksum: "4fdbc510aa692aaa06f46f8e97b9767e382091d77cd451439d7885bfffdb464d"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATOguryAdapter.zip",
            checksum: "85f236126eaf6f3ab62135f45c4cd3771c3f2e1d8ce9edb44de01037610325a9"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATUTIQAdapter.zip",
            checksum: "79d2dbf383cc091ae4a306ebba54e265a43b4ad581cc7088882c056ecce848d0"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATYOCAdapter.zip",
            checksum: "c2362e2bebf894e871d4609c3961035d0defa97fce463f713440050e345b9d2e"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATKit.zip",
            checksum: "9fa6738a4a124a25adb4550a13a11d593bd08bb2684dea4c5aa995328e317bfc"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATTappxAdapter.zip",
            checksum: "4cc053232d9919a214cd948ada55665b6081b6d3762859463d7c3e5e6e75e54e"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATAppLovinAdapter.zip",
            checksum: "1d0c354c49a38e9422a5c98ce38901a7d7bf20efe3c8b8db70b79dd5af1bfa7a"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATAppHarbrAdapter.zip",
            checksum: "a48bd9c5c6d65dba5a8c63e7f860a4bc2fdf80019e7122c4463992e35bde9539"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AATTeadsAdapter.zip",
            checksum: "145fc82c187863c8d4641a6cf8d973e7e0117912378e548c8fc741558931509a"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AppConsent.zip",
            checksum: "cb06cd3448aebda3437a9ea79b776fbc0d25daaae5e6390afbb896a2ed6410f2"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/UnityAds.zip",
            checksum: "f8a21152868c89c89a7b027bb76bdfed849a7a84f9d3fe70f6cf50657fed9754"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/OguryCore.zip",
            checksum: "aa85742f36c4c0044290661834c522ab1179e10cd00fea06bbfe720713efc8d9"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/OMSDK_Ogury.zip",
            checksum: "091e7650561099d7c146def1f70f5c583a50b0260fdee80bd08139398a7dafed"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/OguryAds.zip",
            checksum: "4d06edabb9a32411567afb4ba418800b70eecdd8e640aa4c2551770804189ac8"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/InMobiSDK.zip",
            checksum: "94ed4c274e060bcc71da83907b6bf065c7271bb0547d7ea15f526a7dd9ccfaa0"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/TeadsSDK.zip",
            checksum: "a349eed6842f7f7486c537c2fa61e043015d2c63b69bee1d3516f052332759d5"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/OMSDK_Teadstv.zip",
            checksum: "3fa0610e50748c4939aef3ceafc584e21ae03f0593f759b730efde0cf793b4b5"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/OgurySdk.zip",
            checksum: "b661bf53d455f64e8eda6ea28317fac9cff01d9ab7dfedf6c229b48fe3bae762"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/FBAudienceNetwork.zip",
            checksum: "483cb5d015c4ede4a70eca8286d3145d60d2d1036e7ee2f4730bc5c392fceab9"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/TappxFramework.zip",
            checksum: "66528bff2483d50694a6d483a23f8b00ef9deb1956b8eea6699e85fdddd09d10"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/OMSDK_Tappx.zip",
            checksum: "460b5f2096968a2e6e47a0d3708335d39026f93086d6f258594b1c2a86a44902"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/VungleAdsSDK.zip",
            checksum: "233393b1605d4ac54e46d3d8ee1b5c92dfda8845075083b586c6574355c615fb"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/IronSourceAdQualitySDK.zip",
            checksum: "873dc15d1595a0990c3001db6834426a13ce28e20e35d270d27cdb7cf3c038cd"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/DTBiOSSDK.zip",
            checksum: "4ed97857677d3d4595350a80cf4dd3a35560135295f9ab4eb04c4a5f555aea36"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/KidozSDK.zip",
            checksum: "8175c0ba6980caf4634b1927be2bb968687ced81106d9fa87a46af24af0ed73e"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/FeedAd.zip",
            checksum: "da9dbee0cae5543706693ee542bbdaca5ea65cee42695952e2ec6dfe660e937b"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/MTGSDKInterstitialVideo.zip",
            checksum: "f1e16de34c9847de521a02d1b1ad4b6a6ac2d1d37cac3cf2d275a095074638a7"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/MTGSDKBanner.zip",
            checksum: "bde00a8782f58604e7a9f6ad49c3ad4b41c579b89835aa3b6f9652a811f47c02"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/MTGSDKBidding.zip",
            checksum: "3fcde5f60e40b0aaf1a7cb2fa19842b477918c6da6cff57d02c8c0a9e9ca3fa8"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/MTGSDKReward.zip",
            checksum: "bccc7b2ae6dffe7e4119a3fcd17c24e01a004ce70ea8df39557d7e9bb16d782a"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/MTGSDKNativeAdvanced.zip",
            checksum: "00e8eb62a4c55eaa1616c8100dc0305891ff5cbc3a08b451a567ffc710dedd5b"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/MTGSDKSplash.zip",
            checksum: "cc2be2406a037efe6d2a348b0f09b8cc3f43a068f68e9d8833788e9373b2dfba"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/MTGSDKNewInterstitial.zip",
            checksum: "c07e16ccfd973e4fc3a8218b1086a66aa1ecff49e2f2d8d13ed5d2a21543a31b"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/MTGSDK.zip",
            checksum: "f5d353cca0a5c434b77de923f98239e783154b7ea5c17e0ad11dd8a2edabb41b"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/IronSource.zip",
            checksum: "1cc54cbe6949ad3f1f0a7d2ec645f81e6bf3c94eef1e8e5095f7bcb428ca791c"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/MolocoSDK.zip",
            checksum: "f523bc2a075c9a7cdc4d9eaf340320cc78e0feb0c8e722ba730bca9a93952286"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/OMSDK_Microsoft.zip",
            checksum: "0e10f4eb856dcc95da39b6e4e76e52218964fc569fff7a87a5b434144a2d12eb"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/AppNexusSDK.zip",
            checksum: "f2eab8170aed432c4476570aa80783fc9cc19d403069d6365778f2bbae52061f"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.2/SASDisplayKit.zip",
            checksum: "ba75ca509eb70c2216a2b63f8347b2524463edddd30fa2519a60cf85a641b6cf"
        ),
    ]
)
