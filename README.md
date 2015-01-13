ShoesCalculator
===============

A calculator written in Ruby using the Shoes graphical API

# INSTALL

We'll get a copy of Shoes running.

* First you'll need to install JRuby. JRuby is Ruby syntax using an interpreter
written in Java, instead of C, which is the language normally used. This allows
shoes to use graphics libraries that are easier to install and work with than
the C-based alternatives.

To begin with, install JRuby as per the instructions http://jruby.org/getting-started

> rvm install jruby

If you see an error relating to C extensions, I had to set the following variable
in bash:

> export JRUBY_OPTS=-Xcext.enabled=true

* And then the shoes4 gem. Resources online at: https://github.com/shoes/shoes4.
Make sure that you are using JRuby before you install the gem

```
rvm use jruby
gem install shoes --pre`
```

* Fork your own copy of this exercise and clone it

* Run shoes with the following command, from the directory you just cloned into

> shoes calculator.rb

# TODO

Over to you. Work through the following improvements and see if you can figure
out how to achieve them. Each time you make a change, commit and push your code
to your GitHub account.

1. Experiment with the user interface, changing colours, layouts,
backgrounds and gradients (don't spend all day on this though)
2. Fix the layout so that the numbers run from 0-9 in rows, e.g 7-8-9
3. Implement a cancel entry (C) button that clears the input
4. Implement other scientific calculator functions:
  * power of two
  * square root
  * log base 2
5. Refactor your code. Where might we use a case statement to simplify our solution?
6. See if you can change the label of the operator buttons to use the
mathematical division label, whilst keeping division function working.
7. Fix the problem where the inputs are treated as integers, not floats, so that
we can get correct results. See if you can have the input keep its integer values.
Hint - ask us for help!

# Homework Extensions

Bonus points for creating another calculator or amending your calculator with
the following features:

* Mortgage calculator: Calculate the monthly payment when given the other variables as input.
* BMI: Calculate the BMI when given the height and weight.

# Submission

Once you're done, submit a pull request so that I can review your work.
