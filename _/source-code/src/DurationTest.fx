var twoMinutes = 0h + 1m + 30s + 30000ms;

if(twoMinutes != 2m) println("Assertion failed");
if(twoMinutes != 120s) println("Assertion failed");
if(twoMinutes != 120000ms) println("Assertion failed");