ETSwipeCell
===========

UITableViewCell's subclass with gestures. You can swipe over cell and see 1 or 2 buttons.

![example](https://raw.github.com/EugeneTrapeznikov/ETSwipeCell/master/demo/demo.gif)

Requirements
------------

- Xcode 5.
- iOS 6 or later.
- ARC.

How to use
=======================

`ETSwipeCell` is a subclass of `UITableViewCell` with `UIGestureRecognizer`.

Include the `ETSwipeCell.h` and `ETSwipeCell.m` in your project.

To use  `ETSwipeCell`, you should create your own class with parent `ETSwipeCell`. Then in `initWithStyle` create your own user interface for cell. And implement buttons and gesture behavior in initializing method.

Example project included.

License
=======================

The MIT License (MIT)

Copyright (c) 2013 Eugene Trapeznikov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Support / Contact / Bugs / Features
-----------------------------------

I can't promise to answer questions about how to use the code.

If you want to submit a feature request or bug report, please use [GitHub's issue tracker for this project](https://github.com/EugeneTrapeznikov/ETSwipeCell/issues).  Or preferably fork the code and implement the feature/fix yourself, then submit a pull request.

Enjoy!

Eugene Trapeznikov

