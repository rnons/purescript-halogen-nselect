module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(Tuple))
import Effect (Effect)
import Effect.Aff (Aff)
import Example.Dropdown as ExpDropdown
import Example.ComponentInDropdown as ExpComponentInDropdown
import Example.Autocomplete as ExpAutocomplete
import Example.TwoInputs as ExpTwoInputs
import Example.Extend.Autocomplete as ExtendAutocomplete
import Example.NSelect2.Dropdown as ExpDropdown2
import Example.NSelect2.TwoInputs as ExpTwoInputs2
import Foreign.Object as Object
import Halogen.Aff as HA
import Halogen.Storybook (Stories, runStorybook, proxy)

stories :: Stories Aff
stories = Object.fromFoldable
  [ Tuple "Dropdown" $ proxy ExpDropdown.component
  , Tuple "Component in dropdown" $ proxy ExpComponentInDropdown.component
  , Tuple "Autocomplete" $ proxy ExpAutocomplete.component
  , Tuple "Two inputs" $ proxy ExpTwoInputs.component
  , Tuple "Extend|Autocomplete" $ proxy ExtendAutocomplete.component
  , Tuple "NSelect2|Dropdown" $ proxy ExpDropdown2.component
  , Tuple "NSelect2|Two inputs" $ proxy ExpTwoInputs2.component
  ]

main :: Effect Unit
main = HA.runHalogenAff do
  HA.awaitBody >>= runStorybook
    { stories
    , logo: Nothing
    }
