port module Update exposing (..)
import Time exposing (Time)

type Msg
    = TogglePlay
    | UpdateRefreshRate Int
    | Tick Time

update msg model =
    case msg of
        TogglePlay ->
            ( togglePlay model, play model )
        UpdateRefreshRate seconds ->
            ( updateRefreshRate seconds model, Cmd.none )
        _ ->
            ( model, Cmd.none )

togglePlay model =
    { model | playing = not model.playing }

updateRefreshRate seconds model =
    { model | refreshSeconds = seconds }

play model = if model.playing then playSound () else Cmd.none
        
port playSound : () -> Cmd msg
