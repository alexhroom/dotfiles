import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.WindowSwallowing

main :: IO ()
main = xmonad
       . withEasySB (statusBarProp "xmobar home/alexhroom/.config/.xmobarrc" (pure def)) defToggleStrutsKey
       $ def
     { modMask = mod4Mask
     , terminal = "urxvt"
     , focusedBorderColor = "white"
     , normalBorderColor = "black"
     , handleEventHook = swallowHook
     }
    `additionalKeysP`
     [ ("M-o", spawn "rofi -show filebrowser"),
       ("M-p", spawn "rofi -show drun")
     ]

swallowHook = swallowEventHook (className =? "URxvt") (return True)
