'use strict'
/* global Elm */ // This will keep your linter happy
var lowTick = new Audio('lowtick.wav');
var $ = require('jquery');
var totalSeconds = 0;
var currentSeconds = 0;

app.ports.js_playSound.subscribe(function(){
    lowTick.play();
});

app.ports.js_initProgress.subscribe(function(totalNumber){
    totalSeconds = totalNumber;
    currentSeconds = 0;
    $("#progress-bar").progress('reset');
    $("#progress-bar").progress({
        total: totalNumber
    });
});

app.ports.js_incrementProgress.subscribe(function(){
    if (totalSeconds <= currentSeconds){
        currentSeconds = 0;
        $("#progress-bar").progress('reset');
    }
    currentSeconds++;
    $("#progress-bar").progress('increment');
});
