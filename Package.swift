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
        .package(url: "https://github.com/AddApptr/RTBSDK.git", exact: Version(1, 9, 1))
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATAmazonAdapter.zip",
            checksum: "f51199d275394b209395e331c441888eb3351c41c54498a9ece1326e604c422b"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATUnityAdapter.zip",
            checksum: "7830959d0da0bae63cf2316271312b29619cd7653c3215413ec8466993d44e20"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATAppNexusAdapter.zip",
            checksum: "515853f26bd648ec0270d3596f533e51a0a7b8fc09027e38238ef55ff9345050"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATSmartAdAdapter.zip",
            checksum: "a2933bcc55a58e9599b90ad92a35f821edd85def1b03f544db55b1a2872bbcf4"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATIronSourceAdapter.zip",
            checksum: "3fcb5bb306712bca437ed685c9e7a5b03f7dc794bee07c9a5fc87083af41810d"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATDFPPrebidAdapter.zip",
            checksum: "c31238754f0cde55ee25a699f9c01d94d2454364a7c4b45aa3ee83b406322d3d"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATGraviteRTBAdapter.zip",
            checksum: "ddbf30d5fd68d245d3f7681a1662564fcf57f65955a0a73d41897a0d9e112325"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/HyBid.zip",
            checksum: "872f0dd992a547eb175b5461cd68818ec4ea3b3e66c8a3bc6772531b587a28eb"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/OMSDK_Pubnativenet.zip",
            checksum: "df2dec9e7a72150e415562f9fea0e650137eb775370fb290df9673828341e2f2"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/ATOM.zip",
            checksum: "25033147eac4ef78d36f0ba8491bf9f9db1862268672f9432bf9b1ee628666e0"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/VisxSDK.zip",
            checksum: "eaefc263eea8a0bd72dce38227faf89888a131104e86b5958c31034ab2b88d60"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/DIOSDK.zip",
            checksum: "315f19fdf9a6f5f5a97ff8c9a79d51da4bcfdc08c58d2b46ee1432b80a325a97"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/OMSDK_Prebidorg.zip",
            checksum: "2d0d068c126b184f371def4234fdf793131a417499782615fd51983fac484a9d"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/PrebidMobile.zip",
            checksum: "d73b46bfca158964968525209d691db251b8943221ea68d973ecb050eaefceb5"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/Utiq.zip",
            checksum: "ea1d90874ff3f05e89744ab867f9fdff5dfba5e19739d0680238d3a4c265b69f"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/ConsentViewController.zip",
            checksum: "1178a91929c69766551fc5e29cbebe412fd6b9cc303bac9e55a79932f16c3a15"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATSourcePointCMPAdapter.zip",
            checksum: "8b4fdd88b87e9de185df9b896049b270b985caae387e4aaf1a3c5f5876a72f68"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATAdMobDSPAdapter.zip",
            checksum: "73bd4c146c41ff4f01a839896686ede2d324c19b748188d362847b3d023972ac"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATSuperAwesomeAdapter.zip",
            checksum: "853865e2aed8bbd5f5411e60d251015669beac7e427807715de8194ec98b0fb4"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATGoogleAdsAdapter.zip",
            checksum: "e2be76d78e4779667ae5f20c2477f7bc562e7a9a6606893986ff6be5f9172bf5"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATDisplayIOAdapter.zip",
            checksum: "ca99653d2b651c42cc439e6d58749371671eaf1d4706118f70aa41234c97a30a"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATPubNativeAdapter.zip",
            checksum: "301a2531f495e6cb54cbc7f72839135cbad6b01b2eac6bebd3065e7c1028ce94"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATMetaBiddingAdapter.zip",
            checksum: "aa7e35a220e69b3c491f6612ceb40efc667e3f43e52d97b894b08741733e9a16"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATVungleAdapter.zip",
            checksum: "b7e1e758e21686facf35ef6e983a36f5660ec641f9323e86ef2f206525d314ef"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATFacebookAdapter.zip",
            checksum: "4826c4d6a3e375c1446974a8c0bc2a805a4bcadde67162b6140ea7484652836b"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATFeedAdAdapter.zip",
            checksum: "730dc26255dc0110e2c3f053254727714eb3d73878527d4be2daa2b61dc89e7a"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATMintegralAdapter.zip",
            checksum: "a43d08848d1df0c726b4a51eeeb2c6df68a8c6d82f77e788e45965ae0e5c1983"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATKidozAdapter.zip",
            checksum: "fd5885513783899b2e798f1dd74f6270bd122a94143054735c08cc17fea635af"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATGoogleCMPAdapter.zip",
            checksum: "d6fdd7fae1ffa1b3c03bab929396a0439c410e98dc8fc7ba1ad4a46001be3816"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATAppConsentAdapter.zip",
            checksum: "256d51b0eca12aca7f1c053ae33b07e5429d70c0a635a733d9e72a0d2efdbfb3"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATMolocoBiddingDSPAdapter.zip",
            checksum: "aebb5f011a69bbf35e9cc6bd279d1554bc4bdeeec5aecf0ede15e7f32f3f8b80"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATAdMobMediationAdapter.zip",
            checksum: "99f8a12e4f22bb6758c8b8f4be02c85c3cc239bd779f1ad4e3150000857f06a2"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATInMobiAdapter.zip",
            checksum: "f8a4c032a703ad8c81fb8fec123de4487aaa368e8f56462b08082ae6813911e2"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATOguryAdapter.zip",
            checksum: "4bfa98b4f7f5f133045a7634e271b124f6671c50bef18f7f9adf759b53b6239f"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATUTIQAdapter.zip",
            checksum: "76eb556d5e73d3d24cc25a0720b45ca337a05cd1ae411311d7783579b27a7751"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATYOCAdapter.zip",
            checksum: "3965986d0a2f2e0d391121a0311e9001daf8a47a6d86988ffb6d9fbaa7b14b47"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATKit.zip",
            checksum: "9f722a14e76946c3ece1a28fab6fa7195e7e03d9837b5869e0885ce401427d35"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATTappxAdapter.zip",
            checksum: "bdcc6ab50051cc5437ef554a2017b2ab29cd739da7bc0d1a553c1fec3218219c"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATAppLovinAdapter.zip",
            checksum: "85dbe25a59caa33ecc0567a57639a3b9bcbeb0502243a7ee37f2ce908d7517b1"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATAppHarbrAdapter.zip",
            checksum: "b1d0a523af166fc8e9924ccc65f6e3e8fac3a512ca36ee60960a96d5b5bb004e"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AATTeadsAdapter.zip",
            checksum: "e1b757520796bf7ba8dd7df56e6b978ab47af08fa8c505cb87adca2db86f2360"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AppConsent.zip",
            checksum: "80d132f0e475e0a0f16dca98be2c58191be2f16e4073ffa8cffee74cac382800"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/UnityAds.zip",
            checksum: "39d6e1b54b2ba21168a31a9ec3668acdfbcc4a238678e152d0b94a0fba38281f"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/OguryCore.zip",
            checksum: "db82fd0279e3fb85a1f6b9ebc1bf0db9b21e956b3c7a065ef212bab3f1210053"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/OMSDK_Ogury.zip",
            checksum: "e53e10983d99e6dea1d43df0fe31fbc3f20685d559a0e7052ccf2f22c49d1c96"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/OguryAds.zip",
            checksum: "75435e08ce34de5e5a143205a19bd51f6f0fd2b6cadd9456f8da1ce9703bb5df"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/InMobiSDK.zip",
            checksum: "ef97044ea5509f892120cdfef143bf0a8eaf86104195e6e80c4e11d9c7163f59"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/TeadsSDK.zip",
            checksum: "86a6735c15dbf83fae88478ef7b7e780812853aa96d9371413c75c9b742ae502"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/OMSDK_Teadstv.zip",
            checksum: "d80c193a73f25a273ac1af757bacbd9913e7ea0c65c884e64429fe772d669518"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/OgurySdk.zip",
            checksum: "70c0a76f733a23a5d873b03f20b66c581b14ab0112a9fcd38d50c0548c2c8e0b"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/FBAudienceNetwork.zip",
            checksum: "dce544af51e91fac3dc0f6ce24bf19b62e8d5594182c09342cd1625c877ef7d7"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/TappxFramework.zip",
            checksum: "f0f637fe0af61369d008c74d0f834c28809866ac3cdcee92b85d5305b77b33c6"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/OMSDK_Tappx.zip",
            checksum: "e955756db33306dd4aee4808f2314f35165eb5b82481960df417450d6f5d0098"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/VungleAdsSDK.zip",
            checksum: "958f1a0baaf2534cbeec49c8d6e8bfda60bd638e32de9d28bd6d75066415c96a"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/IronSourceAdQualitySDK.zip",
            checksum: "22884421fc0a518debff93f0c87648e776330cda1a32ce88a231ebf6393ae7db"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/DTBiOSSDK.zip",
            checksum: "e3c8e1381c694543d8f757dfe71ab1857d87726bbade74b0e596873172f1203a"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/KidozSDK.zip",
            checksum: "ee97af20dc62bbe4a5d94476a083f618fc376380b106cc763fb3b7398ee7a5ac"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/FeedAd.zip",
            checksum: "a4e2b012b134551cea4dc1021f7d63579c73ccb913fc88b2730d7e9379045a60"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/MTGSDKInterstitialVideo.zip",
            checksum: "ca20a9fce2520222bfba7bcc16f111485f40e2300f2235b783925937f303b394"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/MTGSDKBanner.zip",
            checksum: "dfe1450930030d2e75f7881f970ed2dfed7a73165154c2cb51720144287f4286"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/MTGSDKBidding.zip",
            checksum: "87081975f360c104a6908038d765382c58283b7fc63a2eb974bd8c670f5f5962"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/MTGSDKReward.zip",
            checksum: "d6d380eeb2a7cf108af365043e87fa9aa9332698892351a278bee05a7fe9ffcd"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/MTGSDKNativeAdvanced.zip",
            checksum: "69db0825f979f761b8eba1b8bb4f420b910d24083cf78553f349d86951e4459d"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/MTGSDKSplash.zip",
            checksum: "2144d5ecfc0212edfa82d8f27800fe6b62a75031cc90cfbdd7a23c4041468360"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/MTGSDKNewInterstitial.zip",
            checksum: "b3979118a63c44f9a206c5637208de03232d57dc77d0aab2d203bc08e6758e1e"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/MTGSDK.zip",
            checksum: "520b7377529b0f65917fff375fb3c5a0229469104da1e3b29acfbe5e545a5bbd"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/IronSource.zip",
            checksum: "7c91fc0a773a42fe51aaaf65a3d19e5a8bb565a4140b21151171c30bb32960cc"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/MolocoSDK.zip",
            checksum: "69add1eeddfb551aa2c3cc8ac2089f0db8145c137f6bf3f06928435114d675df"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/AppNexusSDK.zip",
            checksum: "585a8da744a4042b6197359b76a2d37887ea247b311d7de6d5721a52676a8c8f"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.2/SASDisplayKit.zip",
            checksum: "5b0d9b180c9fad76061f9872da3513f66a4714577bf3b9b1821f54c98444d5c3"
        ),
    ]
)
