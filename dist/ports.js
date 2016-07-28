'use strict'
/* global Elm */ // This will keep your linter happy
var lowTick = new Audio('lowtick.wav');
app.ports.playSound.subscribe(function(){
    lowTick.play();
});
