port module Update exposing (..)
import Time exposing (Time)
import Task


type Msg
    = TogglePlay
    | UpdateRefreshRate Int
    | Tick Time
    | InitializeProgressBar

update msg model =
    case msg of
        TogglePlay ->
            ( togglePlay model, Cmd.none )
        UpdateRefreshRate seconds ->
            ( updateRefreshRate seconds model, afterUpdate )
        InitializeProgressBar ->
            ( resetTime model, maybeInitProgressBar model )
        Tick _ ->
            ( ticked model, afterTick model )

afterUpdate : Cmd Msg
afterUpdate = Task.perform identity identity (Task.succeed InitializeProgressBar)

afterTick model =
    if model.currentSeconds >= model.refreshSeconds
    then Cmd.batch [maybePlay model, maybeInitProgressBar model]
    else maybeIncrementProgressBar model

togglePlay model =
    { model | playing = not model.playing }

updateRefreshRate seconds model =
    { model | refreshSeconds = seconds }

ticked model =
    if model.playing
    then { model | currentSeconds =
               if model.currentSeconds >= model.refreshSeconds
               then 0
               else model.currentSeconds + 1
         }
    else model

resetTime model = { model | currentSeconds = 0 }

maybeInitProgressBar model =
    if not model.playing
    then js_initProgress model.refreshSeconds
    else Cmd.none

maybePlay model =
    if model.playing
    then js_playSound ()
    else Cmd.none

maybeIncrementProgressBar model =
    if model.playing
    then js_incrementProgress ()
    else Cmd.none
        
port js_playSound : () -> Cmd msg
port js_incrementProgress : () -> Cmd msg
port js_initProgress: Int -> Cmd msg
