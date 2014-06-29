# README

This is the code from my quick lecture on debugging.

### Debugging Guidelines

(In no particular order.)

* _Look at the console, not your code._ At least initially, the console is way more informative about what broke and where than your code is.

* _Follow the trail._ So it often happens that the stack takes you to code that isn't necessarily broken, but is getting some bad input or something. That's fine. Your job now is to follow the trail-- figure out what other methods are being called, and what could produce that error.

* _Test regularly._ Once you have the potential problem nailed down, change one thing at a time and test it. That being said, any time you ever change anything, you should test it.

* _Google promiscuously._ It's okay if you don't know what a particular error means. But if you've solved the problem, and you still don't know why you got that error, then that's totally _not_ okay. Google everything and anything.
