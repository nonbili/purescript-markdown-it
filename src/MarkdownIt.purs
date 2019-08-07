module MarkdownIt
  ( renderString
  , MarkdownIt
  , Preset(..)
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

data Preset
  = CommonMark
  | Default
  | Zero

instance showPreset :: Show Preset where
  show = case _ of
    CommonMark -> "commonmark"
    Default -> "default"
    Zero -> "zero"

data MarkdownItOptions

-- | Create a new MarkdownIt instance
newMarkdownIt :: Preset -> O.Options MarkdownItOptions -> Effect MarkdownIt
newMarkdownIt preset opts = runEffectFn2 newMarkdownIt_ (show preset) $ O.options opts
foreign import newMarkdownIt_ :: EffectFn2 String Foreign MarkdownIt

-- | Use an existing MarkdownIt instance to render markdown string to html
-- | string.
render :: String -> MarkdownIt -> Effect String
render = runEffectFn2 render_
foreign import render_ :: EffectFn2 String MarkdownIt String
