var exec = require('cordova/exec');

exports.IsDebugBuild = function (success, error) {
    exec(success, error, 'IsDebug', 'IsDebugBuild');
};

exports.IsJailBreakDevice = function (success, error) {
    exec(success, error, 'MobileDeviceSecurity', 'IsJailBreakDevice');
};

exports.IsDebuggerConnected = function (success, error) {
    exec(success, error, 'MobileDeviceSecurity', 'IsDebuggerConnected');
};


