; gui definer
Gui, Add, Text, x20 y30 w360 h80 Center, Made by Salami Ninja on Youtube!`nMy Discord: sjs7 - Subscribe for more`nAfter pressing OK, this script will be running. The default key for toggling the script is "F1". You can edit this by right-clicking on the file and changing the script.

; Ok btn
Gui, Add, Button, x150 y130 w100 h30 gOkButton, OK

; guititle
Gui, Show, Center w400 h200, Made by Salami Ninja on Youtube

return

; Define the function for the OK button
OkButton:
    Gui, Destroy ; Close the GUI when the OK button is pressed
    ; Add your script logic to run after pressing OK here
    MsgBox, The script is now running! ; For demonstration purposes
return

; Initialize the toggle state as false (not pressed)
toggleState := false

f1:: ; The ButtonPress for toggling the script-
    toggleState := !toggleState  ; Toggle the state
    if (toggleState)
    {
        ; Press and hold Mouse4
        SendInput {XButton2 down}
    }
    else
    {
        ; Release Mouse4
        SendInput {XButton2 up}
    }
return
