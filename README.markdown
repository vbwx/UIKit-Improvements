UIKit Improvements
==================
Sometimes, Apple's UIKit classes don't enable you to customize the views the
way you want. That's where our improvements come in.
This is a collection of Xcode projects consisting of categories and subclasses
that have been designed to be easy to use.

To see these improvements "in the wild", just take a look at our apps! More
information at [quantapps.com](http://www.quantapps.com "QuantApps").

Projects
--------
### QALabel ###
Subclass of `UILabel` that adds a vertical alignment property. In Interface
Builder, insert a regular label, then set its class to `QALabel` and change
the vertical alignment in, e.g., your view controller.

### QABackgroundView ###
Subclass of `UIView` that simply shows `bg.png` as background. The great thing
about it is that you can use it in Interface Builder by setting the desired
view's class to `QABackgroundView`.

### QAPatternView ###
Subclass of `UIView` that uses `pattern.png` as repeatable background; also it
adds an image above and below the actual view (useful for shadows) in addition
to an image on top of the pattern, which is useful for a glow effect.

### ViewAdditions ###
This is a simple category on `UIView` that makes it easier to retrieve a
subview.

### NavigationBar ###
This is a collection of categories that allow you to fully customize the
`UINavigationBar` along with its title and buttons. With one line of code in
`-viewWillAppear:` of every view controller you can also customize the back
button and thus make your app stand out!
