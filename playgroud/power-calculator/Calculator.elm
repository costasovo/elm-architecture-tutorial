module Calculator where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


-- MODEL

type alias Model =
  {
    result: Int,
    houseType: String,
    area: Int
  }

init: Model
init = 
  { result = 0,
    houseType = "20+",
    area = 10
  }


-- UPDATE

type Action = Compute | Reset

update : Action -> Model -> Model
update action model =
  case action of
    Compute ->
      { model |
          result = if model.houseType == "20+" then model.area * 10 else model.area * 5
      }

    Reset ->
      init


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ p [ resultStyle ] [ text (toString model.result) ]
    , input [ value (toString model.area)] []
    , select []
      [ option [ value "20+" ] [ text "Dum nad 20 let"]
      , option [ value "20-" ] [ text "Dum do 20 let"]
      ]
    , br [][]
    , button [ onClick address Compute ] [ text "Compute" ]
    , button [ onClick address Reset ] [ text "Reset" ]
    ]


resultStyle : Attribute
resultStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]
