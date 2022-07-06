import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let batteryChannel = FlutterMethodChannel(
            name: "lnu.2022/device_name",
            binaryMessenger: controller.binaryMessenger
        )
        
        batteryChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            // This method is invoked on the UI thread.
            guard call.method == "getDeviceName" else {
                result(FlutterMethodNotImplemented)
                return
            }
            self?.getDeviceName(result: result)
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    private func getDeviceName(result: FlutterResult) {
        result(UIDevice.current.name)
    }
    
}
