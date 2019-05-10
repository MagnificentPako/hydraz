module Main where

import           Data.Maybe
import           DBus.Notify
import           System.Random         (newStdGen)
import           System.Random.Shuffle (shuffle')

hydraz :: [String]
hydraz = [ "Whatever you're doing, you're doing it wrong"
         , "retard"
         , "did that take you 24 hours to write?"
         , "that's a stupid idea in general"
         , "that is not useful"
         , "being right all the time is kinda my thing"
         , "are you sure you're qualified"
         , "bad idea"
         , "it's probably awful"
         , "that is *horrid*"
         , "rewrite it in urn"
         , "you're wrong"
         , "get your shit together"
         , "your opinion is wrong"
         , "talking to you feels rather like talking to the walls\nexcept the walls don't ask stupid questions"
         , "you're doing it wrong"
         , "nothing about that code is nice"
         , "what the fuck how are you still on about this\ndo you have nothing better to do"
         , "who cares"
         , "You write spaghetti"
         , "holy shit why"
         , "it is thoroughly boring but i didn't expect much from... you"
         , "what i'm saying is ding dong your opinion is wrong"
         , "why would you do that to yourself"
         , "i don't see the relevance"
         , "i dislike the implication that your stupidity is in the past tense"
         , "your fingers type so much shit my asshole is envious"
         , "you have a phd in stupid"
         ]

main :: IO ()
main = do
    g <- newStdGen
    c <- connectSession
    n <- notify c blankNote { appName = "hydraz"
                            , summary = "hydraz"
                            , body = Just . Text $ shuffle' hydraz (length hydraz) g !! 0
                            , hints = [ Urgency Critical ]
                            }
    return ()
