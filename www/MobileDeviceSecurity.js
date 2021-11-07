var exec = require('cordova/exec');

exports.IsDebugBuild = function (success, error) {
    exec(success, error, 'IsDebug', 'IsDebugBuild');
};

exports.IsJailBreakDevice = function (success, error) {
    exec(success, error, 'MobileDeviceSecurity', 'IsJailBreakDevice');
};

exports.IsDebugerConnected = function (success, error) {
    exec(success, error, 'MobileDeviceSecurity', 'IsDebugerConnected');
};


