{-# LANGUAGE OverloadedStrings #-}
module My.Yaml.User where

import Data.Yaml
import Control.Applicative -- <$>, <*>

data MyUser = MyUser {
    id :: Int,
    name :: String,
    reputation :: Int
  } deriving (Show)

instance FromJSON MyUser where
    parseJSON (Object v) = MyUser <$>
                           v .: "id" <*>
                           v .: "name" <*>
                           v .: "reputation"
    -- A non-Object value is of the wrong type, so fail.
    parseJSON _ = error "Can't parse MyUser from YAML/JSON"
