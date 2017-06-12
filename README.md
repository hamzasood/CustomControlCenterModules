#  CustomControlCenterModules

The new control centre in iOS 11 is extendable by addition of modules. This project contains a few example modules.

A module is a loadable bundle with a principal class that conforms to `CCUIContentModule`. Modules have to placed in `/System/Library/ControlCenter/Bundles` in order to be discovered. However a module will be ignored unless it has been whitelisted by adding its bundle identifier to `/System/Library/PrivateFrameworks/ControlCenterServices.framework/ModuleWhitelist.plist`.

Modules should favour UI elements in `ControlCenterUIKit` as opposed to `UIKit` so that they'll better match the control centre theme.

Note that modules all get loaded into the same process. So class names should be such that the chance of a collision is minimal.
