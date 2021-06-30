var axios = require('axios');
var qs = require('qs');
if (process.env.NODE_ENV !== 'production') {
    require('dotenv').config();
}
var UNMS_URL = process.env.UNMS_URL;
var UNMS_USERNAME = process.env.UNMS_USERNAME;
var UNMS_PASS = process.env.UNMS_PASS;
var UNMS_KEY = process.env.UNMS_KEY1;

var data = qs.stringify({
    'password': UNMS_PASS,
    'username': UNMS_USERNAME
});

var uploadData = `{"passphrase":"${UNMS_KEY}"}`;

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
            'x-auth-token': token
        }
        return axios(config2);
    }).then(function (response) {
    console.log(JSON.stringify(response.data));
}).catch(function (error) {
    if (error.response) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx
        console.log(error.response.data);
        console.log(error.response.status);
        console.log(error.response.headers);
    } else if (error.request) {
        // The request was made but no response was received
        // `error.request` is an instance of XMLHttpRequest in the browser and an instance of
        // http.ClientRequest in node.js
        console.log(error.request);
    } else {
        // Something happened in setting up the request that triggered an Error
        console.log('Error', error.message);
    }
    console.log(error.config);
});
