This is how far I got in an interview on the Gilded Rose kata in 90 minutes. I had never seen Gilded Rose prior to this.

My process was:

1. Write tests (in this scenario you started with no tests)
2. Hack the original to fit the new Conjured requirement (My interviewer showed me how to do this... it's actually really hard!!!)
3. Looked at the code, thought about it, talked over it a bit with my interviewer, and then decided to refactor with a [command pattern](https://en.wikipedia.org/wiki/Command_pattern)
3. I decided to leave the original implementation as-is so I could refer back to it, and then made a `new_` implementation and test file.
4. Interview ended at the point of this commit.

After the interview, I googled "Gilded Rose" and watched Sandi Metz's [All the Little Things](https://www.youtube.com/watch?v=8bZh5LMaSmE), which goes through this kata and talks about it. I had heard of this talk before but I didn't attend that Railsconf so I never saw it. Some thoughts and learnings:

* Sandi "cheats" a bit by changing the Item class (not allowed in the original kata) and implements Conjured items in a way that's not really how the requirements say you should (any item can be Conjured). My interviewer pointed out the latter, which led me to choose the command pattern. She also didn't have to write her own tests.
* Sandi's initial intermediate refactorings are gorgeous. I decided instead to do a full rewrite, because I "knew" where I wanted to end up. In retrospect, Sandi's approach is superior because I could have been "wrong" and learned that in the intermediate refactoring.
* Sandi's point that our default modus operandi as programmers is to "glom more on to the thing that sort of looks the most like what we need to add". Such a great insight, I'm sure I'll try to notice more in the future when I'm following this "default" mode of thinking and try to shake myself out of it (or at least consider my course of action more deeply).
* I like how I refactored the assertion, I think it helped a lot when writing all the tests.
* Sandi's method of turning the case statement into a hash was pretty great - I think I could have done the same and asked if the item name `match?`ed each key to add the appropriate Trait.
* Sandi is so good at naming things, yikes. My names tend to be much more verbose without adding any clarity or information.
* I think Gilded Rose is totally fair as an interview question, so long as you understand you're watching the thought process and method and not "did this person get The Correct Answer" or not
* My solution ended up looking a lot like Sandi's final "small objects" solution but without inheritance.
* Sandi refactored the original "ticks" into some _really_ readable stuff. I like the way those methods look with 1-liners like `@sell_in += 1 if condition` and whatnot.

