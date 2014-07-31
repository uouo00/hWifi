module Network.Types where

import Control.Monad.Writer (WriterT)

type WifiMonad w a = WriterT w IO a
type SSID  = String
type Signal= String
type Wifi  = (SSID, Signal)
type Log   = String

-- | A command is either to scan wifi or to connect to one.
--
data Command = Scan { scan :: String }
             | Connect { connect :: String -> String }

instance Show Command where
  show (Scan _) = "Scanning for finding some Wifi"
  show (Connect _) = "Connecting to an elected Wifi..."
