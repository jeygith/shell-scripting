var axios = require('axios');
var qs = require('qs');
var UNMS_URL = process.env.UNMS_URL;
var UNMS_USERNAME = process.env.UNMS_USERNAME;
var UNMS_PASS = process.env.UNMS_PASS;
var UNMS_KEY = process.env.UNMS_KEY;
console.log(UNMS_KEY);
return 0;


var data = qs.stringify({
    'password': UNMS_PASS,
    'username': UNMS_USERNAME
});

var uploadData = `{"passphrase":"${UNMS_KEY}"}`;

console.log(uploadData);
return 0;


var config = {
    method: 'post',
    url: UNMS_URL + '/api/v2.1/user/login',
    headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'
    },
    data: data
};
var config2 = {
    method: 'post',
    url: UNMS_URL + '/api/v2.1/vault/credentials/unlock',
    headers: {
        'x-auth-token': '',
        'content-type': 'application/json;charset=UTF-8'
    },
    data: uploadData
};

axios(config)
    .then(function (response) {
        var token = response.headers['x-auth-token'];
        // unlock method
        config2.headers = {
            ...config2.headers,
            'x-auth-token':token
        }
        return axios(config2);
    }).then(function (response) {
    console.log(JSON.stringify(response.data));
})
    .catch(function (error) {
        console.log(error);
    });
