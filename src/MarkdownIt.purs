module MarkdownIt
  ( renderString
  , MarkdownIt
  , MarkdownItOptions
  , newMarkdownIt
  , render
  ) where

import Prelude

import Data.Options as O
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Foreign (Foreign)

-- | Parse and render markdown string to html string.
renderString :: String -> Effect String
renderString = runEffectFn1 renderString_
foreign import renderString_ :: EffectFn1 String String

data MarkdownIt

data MarkdownItOptions

-- | Create a new MarkdownIt instance
newMarkdownIt :: O.Options MarkdownItOptions -> Effect MarkdownIt
newMarkdownIt opts = runEffectFn1 newMarkdownIt_ $ O.options opts
foreign import newMarkdownIt_ :: EffectFn1 Foreign MarkdownIt


-- | Use an existing MarkdownIt instance to render markdown string to html
-- | string.
render :: String -> MarkdownIt -> Effect String
render = runEffectFn2 render_
foreign import render_ :: EffectFn2 String MarkdownIt String
