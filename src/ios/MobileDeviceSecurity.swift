import Cordova
import Cordova
import Foundation

@objc(MobileDeviceSecurity)
class MobileDeviceSecurity : CDVPlugin{

    @objc(IsDebuggerConnected:)
    func IsDebuggerConnected(command : CDVInvokedUrlCommand){
        let debugStatus = amIDebugged()
        let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: debugStatus)
        self.commandDelegate.send(result, callbackId: command.callbackId)
    }

    @objc(IsJailBreakDevice:)
    func IsJailBreakDevice(command : CDVInvokedUrlCommand){
        let check = IOSSecuritySuite.amIJailbrokenWithFailMessage();
        let result = check.jailbroken
        let message = check.failMessage
        var cordovaResult:CDVPluginResult
        cordovaResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: result)
        self.commandDelegate.send(cordovaResult, callbackId: command.callbackId)
    }

    @objc(IsDeviceAnEmulator:)
    func IsDeviceAnEmulator(command : CDVInvokedUrlCommand){
        let check = IOSSecuritySuite.amIRunInEmulator();
        let result = check
        let message = ""
        var cordovaResult:CDVPluginResult
        cordovaResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: result)
        self.commandDelegate.send(cordovaResult, callbackId: command.callbackId)
    }

    @objc(IsAnyHackingToolPresent:)
    func IsAnyHackingToolPresent(command : CDVInvokedUrlCommand){
        let check = IOSSecuritySuite.amIReverseEngineered();
        let result = check
        let message = ""
        var cordovaResult:CDVPluginResult
        cordovaResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: result)
        self.commandDelegate.send(cordovaResult, callbackId: command.callbackId)
    }



    func amIDebugged() -> Bool {

        var kinfo = kinfo_proc()
        var mib: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var size = MemoryLayout<kinfo_proc>.stride
        let sysctlRet = sysctl(&mib, UInt32(mib.count), &kinfo, &size, nil, 0)

        if sysctlRet != 0 {
            print("Error occured when calling sysctl(). The debugger check may not be reliable")
        }

        return (kinfo.kp_proc.p_flag & P_TRACED) != 0
    }
    
    

}
