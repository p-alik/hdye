module Main (main) where
import Data.Yaml
import Data.Maybe (fromJust)

import qualified Data.ByteString.Char8 as BS
import My.Yaml.User

import Paths_hdye


main = do
  f <- getDataFileName "users.yml"
  putStrLn $ "read file " ++ f
  ymlData <- BS.readFile f
  let users = Data.Yaml.decode ymlData :: Maybe [MyUser]
  print $ fromJust users
