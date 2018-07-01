'use strict';

exports.handler = (event, context, callback) => {
  var response = {
    statusCode: 200,
    headers: {
      'Content-Type': 'text/html; charset=utf-8',
    },
    body: "<p>Hello world! New version!</p>",
  };
  callback(null, response);
}