import CodeWorld

topCircle c = colored c (translated 0 2.5 (solidCircle 1))
midCircle c = colored c (translated 0 0 (solidCircle 1))
botCircle c = colored c (translated 0 (-2.5) (solidCircle 1))

frame = rectangle 2.5 7.5
trafficLight = botCircle yellow & topCircle red & midCircle green & frame

greenSignal = botCircle white & topCircle white & midCircle green & frame
yellowSignal = botCircle yellow & topCircle white & midCircle white & frame
redSignal = botCircle white & topCircle red & midCircle white & frame

ourPicture :: Picture
ourPicture = trafficLight

trafficController :: Double -> Picture
trafficController t
  | round (t/3) `mod` 2 == 0 = greenSignal
  | round (t/7) `mod` 2 == 0 = redSignal
  | otherwise = yellowSignal

main :: IO ()
main = animationOf trafficController
