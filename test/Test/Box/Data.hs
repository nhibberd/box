{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
module Test.Box.Data where

import           Box.Data

import           Disorder.Core.IO
import           Disorder.Core.Tripping

import           P

import           Test.Box.Arbitrary ()
import           Test.QuickCheck


prop_parse_query_tripping = tripping queryRender queryFromText

prop_parse_box_tripping   = tripping boxToText boxFromText
prop_parse_boxes_tripping = tripping boxesToText boxesFromText

prop_select_host b bs = testIO . fmap isJust . selectRandomBox $ b : bs
prop_select_host_none = testIO . fmap isNothing . selectRandomBox $ []


return []
tests = $quickCheckAll
