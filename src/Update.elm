module Update exposing (..)
import Time exposing (Time)

type Msg
    = TogglePlay
    | UpdateRefreshRate Int
    | Tick Time

update msg model =
    case msg of
        TogglePlay ->
            ( togglePlay model, Cmd.none )
        UpdateRefreshRate seconds ->
            ( updateRefreshRate seconds model, Cmd.none )
        _ ->
            ( model, Cmd.none )

togglePlay model =
    { model | playing = not model.playing }

updateRefreshRate seconds model =
    { model | refreshSeconds = seconds }
