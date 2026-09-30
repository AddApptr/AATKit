# AATKit

The core AATKit Swift package. It ships AATKit itself and has no third-party dependencies.

Ad networks and CMPs are distributed as separate `AATKit-<Network>` packages, so you only pull in the SDKs of the networks you actually use. Add this package for the core SDK, then add a package per network you have configured.

* For more information about integration steps, please refer to the [integration documentation](https://aatkit.gitbook.io/ios-integration/start/setup/swift-package-manager)

## Important Note
You have to add -ObjC in your build settings by following these steps:

* Click on the project navigator
* Click on your target and build settings
* Search for "other linker flags"
* Add "-ObjC"
