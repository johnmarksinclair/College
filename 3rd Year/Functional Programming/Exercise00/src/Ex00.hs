module Ex00 where

name, idno, username :: String
name      =  "Sinclair, John"  -- replace with your name
idno      =  "16325734"    -- replace with your student id
username  =  "sinclajo"   -- replace with your TCD username


declaration -- do not modify this
 = unlines
     [ ""
     , "@@@ This exercise is all my own work."
     , "@@@ Signed: " ++ name
     , "@@@ "++idno++" "++username
     ]

{- Modify everything below here as you see fit to ensure all tests pass -}

hello  =  "Hello World :-)"
