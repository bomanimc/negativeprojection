var express = require('express');
var app = new express();

app.set('port', 3000);

app.get('/grip', function(req, res) {
    res.send("HI THERE");
});

app.listen(app.get('port'), function() {
    console.log('Express server listening on port ' + app.get('port'));
});
