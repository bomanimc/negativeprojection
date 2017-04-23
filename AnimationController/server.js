var express = require('express');
var Leap = require('leapjs');

var app = new express();
app.set('port', 3000);

var controller = new Leap.Controller();
controller.connect();

var handState = 0;

Leap.loop({
    hand: function(hand){
        var strength = hand.grabStrength;
        handState = (strength > 0.90) ? 1 : 0;
    }
});

app.get('/grip', function(req, res) {
    res.send({handState: handState});
});

app.listen(app.get('port'), function() {
    console.log('Express server listening on port ' + app.get('port'));
});
