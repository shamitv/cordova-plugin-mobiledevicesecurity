var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'MobileDeviceSecurity', 'coolMethod', [arg0]);
};
