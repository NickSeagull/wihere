module Update exposing (..)
import Time exposing (Time)

type Msg
    = TogglePlay
    | Tick Time

update msg model =
    case msg of
        TogglePlay ->
            ( togglePlay model, Cmd.none)
        _ ->
            ( model, Cmd.none )

togglePlay model =
    { model | playing = not model.playing }
