module Test.Main where

import Prelude

import Data.Options ((:=))
import Data.Traversable (sequence_)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Class (liftEffect)
import Jest (expectToEqual, test)
import MarkdownIt (Preset(..), html, linkify, highlight, newMarkdownIt, render, renderString, use)
import Node.Globals as Globals

cases :: Array (Tuple String String)
cases =
  [ Tuple "# head" "<h1>head</h1>\n"
  , Tuple
      "<https://purescript.org>"
      "<p><a href=\"https://purescript.org\">https://purescript.org</a></p>\n"
  ]

main :: Effect Unit
main = do
  test "renderString" $ do
    sequence_ $ cases <#> \(Tuple input output) -> do
      html <- liftEffect $ renderString input
      expectToEqual html output

  test "newMarkdownIt and render" $ do
    md <- liftEffect $ newMarkdownIt Default mempty
    sequence_ $ cases <#> \(Tuple input output) -> do
      html <- liftEffect $ render md input
      expectToEqual html output

  test "default is safe render" $ do
    md <- liftEffect $ newMarkdownIt Default mempty
    let
      input = "<script>alert()</script>"
      output = "<p>&lt;script&gt;alert()&lt;/script&gt;</p>\n"
    html <- liftEffect $ render md input
    expectToEqual html output

  test "set html option to do unsafe render" $ do
    md <- liftEffect $ newMarkdownIt Default $
      html := true
    let
      input = "<script>alert()</script>"
      output = "<script>alert()</script>"
    html <- liftEffect $ render md input
    expectToEqual html output

  test "renderInline" $ do
    md <- liftEffect $ newMarkdownIt Default mempty
    let
      input = "# head"
      output = "<h1>head</h1>\n"
    html <- liftEffect $ render md input
    expectToEqual html output

  test "linkify" $ do
    md <- liftEffect $ newMarkdownIt Default $
      linkify := true
    let
      input = "https://purescript.org"
      output = "<p><a href=\"https://purescript.org\">https://purescript.org</a></p>\n"
    html <- liftEffect $ render md input
    expectToEqual html output

  test "highlight" $ do
    md <- liftEffect $ newMarkdownIt Default $
      highlight := \str lang -> "<pre>" <> lang <> " - " <> str <> "</pre>"
    let
      input = "```js\nalert()\n```"
      output = "<pre>js - alert()\n</pre>\n"
    html <- liftEffect $ render md input
    expectToEqual html output

  test "use markdown-it-imsize" $ do
    md <- liftEffect $ (newMarkdownIt Default $ linkify := true) >>=
      use (Globals.unsafeRequire "markdown-it-imsize")
    let
      input = "![](src =32x32)"
      output = "<p><img src=\"src\" alt=\"\" width=\"32\" height=\"32\"></p>\n"
    html <- liftEffect $ render md input
    expectToEqual html output
