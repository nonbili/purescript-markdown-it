module MarkdownIt
  ( renderString
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

-- | Parse and render markdown string to html string.
renderString :: String -> Effect String
renderString = runEffectFn1 renderString_
foreign import renderString_ :: EffectFn1 String String
