; #Warn
#Requires AutoHotkey v2.0+
#SingleInstance Force
; if (!A_IsCompiled && !InStr(A_AhkPath, "_UIA")) {
;     Run "*UIAccess " A_ScriptFullPath
;     ExitApp 0
; }
~!Space::Reload
~Escape::ExitApp
;;========================


; Create the main menu
OneMenu := Menu()
Online_Shopping := Menu() 
(item := "Electronics", Online_Shopping.Add(item, (*) => Electronics()), Online_Shopping.SetIcon(item, "Shell32.dll", 266))
(item := "Fashion", Online_Shopping.Add(item, (*) => Fashion()), Online_Shopping.SetIcon(item, "Shell32.dll", 266))
(item := "Home && Furniture", Online_Shopping.Add(item, (*) => Home_furniture()), Online_Shopping.SetIcon(item, "Shell32.dll", 266))
(item := "Groceries", Online_Shopping.Add(item, (*) => Groceries()), Online_Shopping.SetIcon(item, "Shell32.dll", 266))
(item := "Beauty && Wellness", Online_Shopping.Add(item, (*) => Beauty_Wellness()), Online_Shopping.SetIcon(item, "Shell32.dll", 266))
(item := "Books", Online_Shopping.Add(item, (*) => Books()), Online_Shopping.SetIcon(item, "Shell32.dll", 266))
(item := "Sports && Fitness", Online_Shopping.Add(item, (*) => Sports_Fitness()), Online_Shopping.SetIcon(item, "Shell32.dll", 266))
(item := "Toys && Baby Products", Online_Shopping.Add(item, (*) => Toys_Baby_Products()), Online_Shopping.SetIcon(item, "Shell32.dll", 266))

news := Menu()
(item := "World News", news.Add(item, (*) => World_News()), news.SetIcon(item, "C:\Program Files\Google\Chrome\Application\chrome.exe", 1))
(item := "Social Media News", news.Add(item, (*) => Social_Media_News()), news.SetIcon(item, "C:\Program Files\Google\Chrome\Application\chrome.exe", 1))
(item := "General News", news.Add(item, (*) => general_news()), news.SetIcon(item, "C:\Program Files\Google\Chrome\Application\chrome.exe", 1))
(item := "Tech News", news.Add(item, (*) => Technology_News()), news.SetIcon(item, "C:\Program Files\Google\Chrome\Application\chrome.exe", 1))
(item := "Financial News", news.Add(item, (*) => Financial_News()), news.SetIcon(item, "C:\Program Files\Google\Chrome\Application\chrome.exe", 1))
(item := "Science News", news.Add(item, (*) => Science_News()), news.SetIcon(item, "C:\Program Files\Google\Chrome\Application\chrome.exe", 1))

Web_Search := Menu()
(item := "Google`tAlt+g", Web_Search.Add(item, (*) => google_search()), Web_Search.SetIcon(item, "gg.png"))
(item := "News", Web_Search.Add(item, (*) => google_news()), Web_Search.SetIcon(item, "news.png"))
(item := "Youtube`tAlt+y", Web_Search.Add(item, (*) => yt_search()), Web_Search.SetIcon(item, "yt.png"))
(item := "Google Maps`tAlt+m", Web_Search.Add(item, (*) => maps()), Web_Search.SetIcon(item, "gm.png"))
(item := "Find in Social Media", Web_Search.Add(item, (*) => Social_Media()), Web_Search.SetIcon(item, "Shell32.dll", 171))

google_search(){
Runurl("https://google.com/search?q=","https://google.com/")
}
google_news(){
    Runurl("https://news.google.com/search?q=", "https://news.google.com/")
}
yt_search(){
Runurl("https://www.youtube.com/results?search_query=" , "https://www.youtube.com")
}
maps(){
Runurl("https://www.google.com/maps/search/","https://www.google.com/maps")
}

!g::google_search()
!y::yt_search()
!m::maps()

; Create and populate the format submenu
formatMenu := Menu()
(item := "lower case`tAlt+L", formatMenu.Add(item, (*) => format_text("L")), formatMenu.SetIcon(item, "shell32.dll", 76))
(item := "UPPER CASE`tAlt+U", formatMenu.Add(item, (*) => format_text("U")), formatMenu.SetIcon(item, "shell32.dll", 76))
(item := "Title Case`tAlt+T", formatMenu.Add(item, (*) => format_text("T")), formatMenu.SetIcon(item, "shell32.dll", 76))
(item := "Clean Lines/Space`tAlt+S", formatMenu.Add(item, (*) => remove_excess_space()), formatMenu.SetIcon(item, "shell32.dll", 76))

; Create and populate the wrap submenu
wrapMenu := Menu()
(item := '"Double Quotes"`tAlt+`'', wrapMenu.Add(item, (*) => wrap('"', '"')), wrapMenu.SetIcon(item, "shell32.dll", 134))
(item := "'Single Quotes'`tAlt+5", wrapMenu.Add(item, (*) => wrap("'", "'")), wrapMenu.SetIcon(item, "shell32.dll", 134))
(item := "(Parentheses)`tAlt+9", wrapMenu.Add(item, (*) => wrap("(", ")")), wrapMenu.SetIcon(item, "shell32.dll", 134))
(item := "[Square Brackets]`tAlt+[", wrapMenu.Add(item, (*) => wrap("[", "]")), wrapMenu.SetIcon(item, "shell32.dll", 134))
(item := "{Curly Brackets}`tCtrl+Alt+[", wrapMenu.Add(item, (*) => wrap("{U+007B}", "{U+007D}")), wrapMenu.SetIcon(item, "shell32.dll", 134))

Systemapps := Menu()
(item := "Bluetooth", Systemapps.Add(item, (*) => Run("ms-settings:bluetooth")), Systemapps.SetIcon(item, "bt.png"))
(item := "List All Apps", Systemapps.Add(item, (*) => Run("shell:appsfolder")), Systemapps.SetIcon(item, "Shell32.dll", 23))
(item := "Uninstaller", Systemapps.Add(item, (*) => Run("appwiz.cpl")), Systemapps.SetIcon(item, "Shell32.dll", 208))
(item := "Manage Users", Systemapps.Add(item, (*) => Run("netplwiz")), Systemapps.SetIcon(item, "Shell32.dll", 112))
(item := "powershell", Systemapps.Add(item, (*) => Run("powershell")), Systemapps.SetIcon(item, "PowerShell.exe", 1))
Systemapps.Add()  ; This line adds a separator
(item := "Shutdown", Systemapps.Add(item, (*) => Shutdown(1)), Systemapps.SetIcon(item, "Shell32.dll", 28))
(item := "Restart", Systemapps.Add(item, (*) => Shutdown(2)), Systemapps.SetIcon(item, "Shell32.dll", 239))
(item := "Hibernate", Systemapps.Add(item, (*) => Run("rundll32.exe powrprof.dll,SetSuspendState 0,1,0")), Systemapps.SetIcon(item, "Shell32.dll", 240))

Daily_Tools := Menu()
(item := "Bulk File Creation", Daily_Tools.Add(item, (*) => Bulknewfile()), Daily_Tools.SetIcon(item, "Shell32.dll", 251))
(item := "Bulk Folder Creation", Daily_Tools.Add(item, (*) => Bulknewfolder()), Daily_Tools.SetIcon(item, "Shell32.dll", 299))
(item := "Strong Password Generator", Daily_Tools.Add(item, (*) => GenerateAndDisplayPasswords()), Daily_Tools.SetIcon(item, "Shell32.dll", 48))
(item := "Percentage Calc", Daily_Tools.Add(item, (*) => ShowPercentageCalculator()), Daily_Tools.SetIcon(item, "calc.png"))
(item := "URL Virus Scanner ", Daily_Tools.Add(item, (*) => checkurl_in_virustotal()), Daily_Tools.SetIcon(item, "Shell32.dll", 245))
(item := "Whatsapp Direct Message", Daily_Tools.Add(item, (*) => wa_send()), Daily_Tools.SetIcon(item, "wa.png"))
(item := "Copy File content", Daily_Tools.Add(item, (*) => CopyFileContent()), Daily_Tools.SetIcon(item, "Shell32.dll", 69))

submenu := Menu()
(item := "Fix spelling && grammer", submenu.Add(item, (*) => OpenChatGPTAndPaste("Please correct any spelling and grammatical errors in the following text, ensuring proper punctuation and sentence structure.")), submenu.SetIcon(item, "chatgptnew.png"))
(item := "Rewrite For Clarity", submenu.Add(item, (*) => OpenChatGPTAndPaste("Rewrite the following text to improve clarity and readability, maintaining the original meaning but making it easier to understand. Also mention what changes have made from the old and new Text")), submenu.SetIcon(item, "chatgptnew.png"))
(item := "Explain this", submenu.Add(item, (*) => OpenChatGPTAndPaste("Please provide a detailed explanation of the concept or information presented in the following text, breaking it down for easier understanding.")), submenu.SetIcon(item, "chatgptnew.png"))
(item := "Find action items", submenu.Add(item, (*) => OpenChatGPTAndPaste("Identify and list any specific actions, tasks, or next steps mentioned or implied in the following text.")), submenu.SetIcon(item, "chatgptnew.png"))
(item := "Summarize", submenu.Add(item, (*) => OpenChatGPTAndPaste("Provide a concise summary of the main points and key ideas from the following text.")), submenu.SetIcon(item, "chatgptnew.png"))
submenu.Add()
(item := "Make Shorter", submenu.Add(item, (*) => OpenChatGPTAndPaste("Condense the following text, preserving the key points while reducing overall length.")), submenu.SetIcon(item, "chatgptnew.png"))
(item := "Make longer", submenu.Add(item, (*) => OpenChatGPTAndPaste("Expand on the given text, adding more details, examples, or explanations to create a more comprehensive version.")), submenu.SetIcon(item, "chatgptnew.png"))
(item := "Change Tone - Simpler", submenu.Add(item, (*) => OpenChatGPTAndPaste("Rewrite the following text using simpler language and concepts. Make it accessible to a general audience, avoiding technical terms and complex ideas. Aim for a version that could be easily understood by someone with basic reading skills.")), submenu.SetIcon(item, "chatgptnew.png"))
(item := "Change Tone - Casual", submenu.Add(item, (*) => OpenChatGPTAndPaste("Rewrite the given text in a more casual, conversational tone. Use informal language, contractions, and a friendly style as if you're talking to a friend. Include colloquialisms where appropriate, but avoid slang that might be too region-specific or obscure.")), submenu.SetIcon(item, "chatgptnew.png"))
(item := "Change Tone - Professional", submenu.Add(item, (*) => OpenChatGPTAndPaste("Rewrite the following text to adopt a more professional and formal tone suitable for a business context.")), submenu.SetIcon(item, "chatgptnew.png"))
submenu.Add()
(item := "Argument Booster`t- Advanced", submenu.Add(item, (*) => OpenChatGPTAndPaste("Strengthen The Given Argument With Additional Evidence Or Reasoning. Present Opposing Views For A Comprehensive Analysis. Incorporate Relevant, Credible Research Findings. Anticipate And Respond To Potential Counterarguments. Use Analogies To Clarify Complex Concepts.")), submenu.SetIcon(item, "chatgpt.png"))
(item := "Language Polisher`t- Advanced", submenu.Add(item, (*) => OpenChatGPTAndPaste("Review The Following Text For Spelling, Punctuation, And Grammatical Errors. Check For Inconsistencies And Improve Overall Coherence. Enhance Sentence Structure And Flow. Rewrite For Better Understanding While Preserving Meaning. Replace Complex Or Field-Specific Terms With Simpler Alternatives. Adjust Structure And Formatting To Increase Engagement.")), submenu.SetIcon(item, "chatgpt.png"))
(item := "Content Enhancer`t- Advanced", submenu.Add(item, (*) => OpenChatGPTAndPaste("Enhance The Following Content By Emphasizing Crucial Information For Clarity. Verify Accuracy Using Reliable Sources And Include Supporting References. Ensure Statistical Information Is Current. Condense Main Ideas Into A Brief Overview. Provide Clear Explanations Suitable For A General Audience. Highlight Specific Tasks Or Next Steps. Add Relevant Stories, Interactive Elements, And Practical Illustrations. Emphasize Positive Outcomes Or Advantages.")), submenu.SetIcon(item, "chatgpt.png"))
(item := "Length Optimizer`t- Advanced", submenu.Add(item, (*) => OpenChatGPTAndPaste("Optimize The Length Of The Following Text. [Shorten/Expand] While [Maintaining Essential Information/Adding Relevant Details]. [Remove Unnecessary Content For Brevity/Provide More Detailed Explanations In Key Areas].")), submenu.SetIcon(item, "chatgpt.png"))
(item := "Structure Refiner`t- Advanced", submenu.Add(item, (*) => OpenChatGPTAndPaste("Improve The Structure Of The Following Content. Remove Repetitive Elements For Focus. Suggest Placements For Helpful Visuals. Enhance Design Elements For Appeal. Reorganize For Easier Reading And Engagement. Ensure Logical Flow With Smooth Transitions. Implement Appropriate Headings, Bullets, And Other Formatting To Improve Readability. Insert Relevant Section Titles And Subtitles.")), submenu.SetIcon(item, "chatgpt.png"))
(item := "Tone Tuner`t- Advanced", submenu.Add(item, (*) => OpenChatGPTAndPaste("Adjust The Tone Of The Following Text To Be [Formal/Casual/Business-Appropriate/Etc.]. [Include Light-Hearted Elements/Adopt A More Serious Style] As Needed. Modify To Reflect [Specific Company Personality Or Values]. Tailor The Content To Connect With [Target Audience].")), submenu.SetIcon(item, "chatgpt.png"))
(item := "Style Enhancer`t- Advanced", submenu.Add(item, (*) => OpenChatGPTAndPaste("Enhance The Style Of The Following Text. Rewrite Sentences To Emphasize Active Voice. Adjust For Precision And Clarity, Especially In Technical Contexts. Vary Sentence Length To Improve Rhythm And Flow. Incorporate Figurative Language Like Metaphors And Similes To Enhance Description. Use Formatting Techniques To Highlight Important Terms Or Phrases.")), submenu.SetIcon(item, "chatgpt.png"))

(item := "Ask ChatGPT", OneMenu.Add(item, submenu), OneMenu.SetIcon(item, "chatgptnew.png"))
(item := "Web Search", OneMenu.Add(item, Web_Search), OneMenu.SetIcon(item, "shell32.dll", 14))
(item := "Unified News Search", OneMenu.Add(item, news), OneMenu.SetIcon(item, "Shell32.dll", 168))
(item := "Online Shopping", OneMenu.Add(item, Online_Shopping), OneMenu.SetIcon(item, "Shell32.dll", 266))
(item := "Format Text", OneMenu.Add(item, formatMenu), OneMenu.SetIcon(item, "shell32.dll", 76))
(item := "Wrap Text", OneMenu.Add(item, wrapMenu), OneMenu.SetIcon(item, "shell32.dll", 134))
OneMenu.Add()
(item := "System", OneMenu.Add(item, Systemapps), OneMenu.SetIcon(item, "shell32.dll", 15))
(item := "Daily_Tools", OneMenu.Add(item, Daily_Tools), OneMenu.SetIcon(item, "Imageres.dll", 36))

;;===========================================================================
; Hotkey to show the main menu
MButton::callmenu()
#w::callmenu()

callmenu(){
copy2clip()
global Search_text := A_Clipboard
    SetPreferredAppMode()
    FlushMenuThemes()
OneMenu.Show()
}

; Hotkeys for text formatting
!l:: format_text("L")  ; Alt+L: Convert to lowercase
!u:: format_text("U")  ; Alt+U: Convert to UPPERCASE
!T:: format_text("T")  ; Alt+T: Convert to Title Case
!s:: remove_excess_space()  ; Alt+S: Clean excess spaces and lines

; Hotkeys for text wrapping
!':: wrap('"', '"')  ; Alt+': Wrap with double quotes
!5:: wrap("'", "'")    ; Alt+5: Wrap with percent signs
!9:: wrap("(", ")")    ; Alt+9: Wrap with parentheses
![:: wrap("[", "]")    ; Alt+[: Wrap with square brackets
~^![:: wrap("{U+007B}", "{U+007D}")    ; Alt+[: Wrap with Curly Brackets

copy2clip() {
bak := ClipboardAll()
A_Clipboard := ""
Send("^c")
if (ClipWait(3, 1)) {
    return A_Clipboard
} else 
ToolTip("Couldn't put text into Clipboard.",)
SetTimer () => ToolTip(), -5000
; MsgBox("Couldn't put text into Clipboard.", , 0x40010)
A_Clipboard := bak

;; version 1
; myclip() {
;     A_Clipboard := ""  ; Clear the clipboard
;     Send "^c"
;     if ClipWait(1)  ; Wait for the clipboard to contain data
;         return A_Clipboard
;     else
;         return ""  ; Return an empty string if the clipboard is empty or the operation timed out
; }
}
; Function to format text case (lower, UPPER, Title)
format_text(n) {
A_Clipboard := copy2clip()
A_Clipboard := Format("{:" . n . "}", A_Clipboard)
Send "^v"
}
; Function to remove excess spaces and normalize line breaks
remove_excess_space() {
A_Clipboard := ""
Send("^c")
ClipWait(1)

text := A_Clipboard
text := RegExReplace(text, "\R{2,}", "`r`n`r`n")  ; Reduce multiple line breaks to double
text := RegExReplace(text, "([^\r\n]) {2,}", "$1 ")  ; Remove excess spaces between words
text := RegExReplace(text, "^ +| +$", "", , -1)  ; Trim leading/trailing spaces from each line
text := Trim(text)  ; Trim entire text

A_Clipboard := text
Send("^v")
}
; Function to wrap selected text with specified characters
wrap(x, y, z := Sleep(300)) {
Send "^x" . z . x . z . "^v" . z . y
}

; ===>> create bulk folder by 'md foldername' using .bat file method
Bulknewfolder(){
Run "Notepad" 
WinWaitActive "Untitled - Notepad"
A_Clipboard := "md folder_name1`nmd folder_name2`nmd folder_name3`nmd folder_name4`nmd folder_name5`nmd folder_name6`nmd folder_name7"
Sendw("^v", 1500)
Sendw("^s", 1500)
sendw("create_bulk_folders.bat{Tab}", 1500)
sendw("{Down 2}{Enter}", 0)
}
; ===>> create bulk files by 'echo.> filename.txt' using .bat file method
Bulknewfile(){
Run 'Notepad'
WinWaitActive 'Untitled - Notepad'
A_Clipboard := 'echo off`necho.>filename1.xls`necho.>hai2.txt`necho.>filename.docx'
Sendw('^v', 1500)
Sendw('^s', 1500)
Sendw('create_bulk_new_files.bat{Tab}', 1500)
sendw('{Down 2}{Enter}', 0)
}
sendw(key, delay:=1000, times := 1) {
loop times {
    SendEvent key
    Sleep delay
}
}
OpenChatGPTAndPaste(prompt) {
if BrowserTabFinder('ChatGPT') {
    Sleep 3000
    click_chatgpt_inputarea('ChatGPT')
    A_Clipboard := prompt . ' > ' . Search_text
    Send '^v' . "{Enter}"
} else {
    Run "https://chat.openai.com/"
    WinWaitActive 'ChatGPT'
    Sleep 3000 ; Wait for 2 seconds
    A_Clipboard := prompt . ' > ' . Search_text
    Send '^v' . "{Enter}"
}
}
;;; ===============================================
click_chatgpt_inputarea(title) {
if WinExist(title) {
    WinGetPos ,,&W, &H, "A"        
    W := W / 2
    H := H - 75
    ; Move the mouse and click
    MouseMove W, H
    Sleep 500
    Click
    Sleep 500
}
}
;;; ===============================================
GenerateAndDisplayPasswords() {
static charSets := Map(
    "l", "abcdefghijklmnopqrstuvwxyz",
    "u", "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    "n", "0123456789",
    "s", "~!@#$%^&*()_+-=[]{}|;:,.<>?"
)

length := InputBox("Enter the desired password length?`n(must be a multiple of 4, like 4, 8, 12, 16, 20 etc.):`n`nFUN FACT: The longest password ever used was 1,273 characters long!`n`nADVICE: Longer passwords are harder to crack.", "Password Generator", "w380 h200").Value
if (length == "" || !IsInteger(length) || length < 4 || Mod(length, 4) != 0) {
    MsgBox("Please enter a valid positive integer that is a multiple of 4.", "Invalid Input", 48)
    return
}

charPerType := length // 4
passwords := []

Loop 10 {
    password := ""
    for _, chars in charSets {
        Loop charPerType {
            password .= SubStr(chars, Random(1, StrLen(chars)), 1)
        }
    }
    passwords.Push(ShuffleString(password))
}

text := ""
for password in passwords {
    text .= password . "`r`n"
}

Run "notepad.exe"
WinWait "Untitled - Notepad"
WinActivate
Sleep 100

A_Clipboard := text
Send "^v"
Send "^{Home}"

ShuffleString(str) {
    chars := StrSplit(str)
    Loop chars.Length - 1 {
        j := Random(A_Index, chars.Length)
        temp := chars[A_Index]
        chars[A_Index] := chars[j]
        chars[j] := temp
    }
    return JoinChars(chars)
}

JoinChars(chars) {
    result := ""
    for char in chars {
        result .= char
    }
    return result
}
}
;;; ===============================================
ShowPercentageCalculator(*) {
per_calc := Gui("+AlwaysOnTop +ToolWindow")
per_calc.BackColor := "Black"
per_calc.SetFont("s11 c0ff768", "Consolas")

; Function to create an Edit control with white text
AddWhiteEdit(gui, options, text := "") {
    pcalc := gui.Add("Edit", options, text)
    pcalc.Opt("+Background202020 cWhite")  ; Dark gray background, white text
    return pcalc
}

per_calc.Add("Text", "x10 y10 w200 h16 +0x200", "What is         % of")
Per1 := AddWhiteEdit(per_calc, "x70 y08 w65 h20 vPer1 Right")
Per2 := AddWhiteEdit(per_calc, "x180 y08 w55 h20 vPer2 Right")
PerA := per_calc.Add("Text", "x240 y10 w70 h16 +0x200 vPerA")

Per3 := AddWhiteEdit(per_calc, "x10 y38 w65 h20 vPer3 Right")
per_calc.Add("Text", "x80 y40 w200 h16 +0x200", "is what % of ")
Per4 := AddWhiteEdit(per_calc, "x180 y38 w55 h20 vPer4 Right")
PerB := per_calc.Add("Text", "x240 y40 w70 h16 +0x200 vPerB")

Per5 := AddWhiteEdit(per_calc, "x10 y68 w65 h20 vPer5 Right")
per_calc.Add("Text", "x80 y72 w200 h16 +0x200", "is        % of what")
Per6 := AddWhiteEdit(per_calc, "x100 y68 w55 h20 vPer6 Right")
PerC := per_calc.Add("Text", "x240 y72 w70 h16 +0x200 vPerC")

per_calc.Add("Text", "x10 y100 w300 h16 +0x200", "-------- Find % of Gain/Loss --------")

per_calc.Add("Text", "x10 y128 w200 h16 +0x200", "From:          TO:")
Per7 := AddWhiteEdit(per_calc, "x55 y125 w70 h20 vPer7 Right")
Per8 := AddWhiteEdit(per_calc, "x160 y125 w75 h20 vPer8 Right")
PerD := per_calc.Add("Text", "x240 y128 w70 h16 +0x200 vPerD")

per_calc.OnEvent("Close", (*) => per_calc.Destroy())
per_calc.Title := "Percentage_Finder"
per_calc.Show("w350 h160")

; Event handlers
Per1.OnEvent("Change", CalcLabel0)
Per2.OnEvent("Change", CalcLabel0)
Per3.OnEvent("Change", CalcLabel1)
Per4.OnEvent("Change", CalcLabel1)
Per5.OnEvent("Change", CalcLabel2)
Per6.OnEvent("Change", CalcLabel2)
Per7.OnEvent("Change", CalcLabel3)
Per8.OnEvent("Change", CalcLabel3)

CalcLabel0(*) {
    PerA.Value := (Per1.Value != "" && Per2.Value != "") 
    ? Round((Per1.Value * Per2.Value) / 100, 2) 
    : ""
}

CalcLabel1(*) {
    PerB.Value := (Per3.Value != "" && Per4.Value != "") 
    ? Round((Per3.Value * 100) / Per4.Value, 2) . "%" 
    : ""
}

CalcLabel2(*) {
    PerC.Value := (Per5.Value != "" && Per6.Value != "") 
    ? Round((Per5.Value * 100) / Per6.Value) 
    : ""
}

CalcLabel3(*) {
    PerD.Value := (Per7.Value != "" && Per8.Value != "") 
    ? Round(((Per8.Value - Per7.Value) / Per7.Value) * 100, 2) . "%" 
    : ""
}
}
;;; ===============================================
checkurl_in_virustotal(){
copy2clip()
; MsgBox copy2clip()
if BrowserTabFinder("VirusTotal - Home") {
    WinWaitActive "VirusTotal - Home"    
    sendw('^v', 2000)
    sendw('{Enter}')
} else {
    Run "https://www.virustotal.com/gui/home/url"
    WinWaitActive "VirusTotal - Home"    
    sendw('^v', 2000)
    sendw('{Enter}')
}
}
; ===>> odified version to work with any default browser on any PC:
BrowserTabFinder(title) {
; Set the title matching mode to 'contains'
SetTitleMatchMode 2

; Define an array of common browser executable names
browsers := ["chrome.exe", "firefox.exe", "msedge.exe", "opera.exe", "brave.exe", "iexplore.exe", "safari.exe"]

; Loop through each browser in the array
for _, browser in browsers {
    ; Check if the current browser is running
    if WinExist("ahk_exe " . browser) {
        ; Activate the browser window
        WinActivate
        ; Get the title of the current tab
        originalTitle := WinGetTitle("A")
        ; Initialize tab counter
        tabCount := 0
        
        ; Start looping through tabs
        Loop {
            ; Increment tab counter
            tabCount++
            ; Switch to the next tab
            Send "^{Tab}"
            ; Wait a bit for the tab to load
            Sleep 100
            
            ; Check if we're still in the browser window
            if WinActive("ahk_exe " . browser) {
                ; Get the title of the current tab
                currentTitle := WinGetTitle("A")
                ; Check if the current tab title contains our target
                if InStr(currentTitle, title) {
                    ; If found, activate the window and return true
                    WinActivate
                    return true
                }
                ; If we've looped back to the start or checked 50 tabs, stop searching
                if (currentTitle == originalTitle || tabCount > 50) {
                    break
                }
            } else {
                ; If we've lost focus on the browser window, show a message and return false
                ToolTip "Browser window lost focus. Total tabs counted: " . tabCount
                SetTimer () => ToolTip(), -5000
                return false
            }
        }
    }
}

; If no supported browser is found or target tab not found, show a message and return false
ToolTip "No supported browser found or target tab not found"
SetTimer () => ToolTip(), -5000
return false
}
BrowserTabUrlFinder(url) {
SetTitleMatchMode 2

browsers := ["chrome.exe", "firefox.exe", "msedge.exe", "opera.exe", "brave.exe", "iexplore.exe", "safari.exe"]

for _, browser in browsers {
    if WinExist("ahk_exe " . browser) {
        WinActivate
        originalTitle := WinGetTitle("A")
        tabCount := 0
        
        Loop {
            tabCount++
            Send "^{Tab}"
            Sleep 300
            
            if WinActive("ahk_exe " . browser) {
                currentTitle := WinGetTitle("A")
                
                ; Get the URL of the current tab
                Send "^l"
                Sleep 500
                currentUrl := A_Clipboard
                A_Clipboard := ""  ; Clear clipboard
                Send "^c"
                ClipWait 1
                if (A_Clipboard != "") {
                    currentUrl := A_Clipboard
                }
                Send "{Esc}"  ; Deselect the URL
                
                ; Check if the current URL matches using InStr
                if InStr(currentUrl, url) {
                    WinActivate
                    return true
                }
                
                ; Check if the current URL matches using RegExMatch
                if RegExMatch(currentUrl, url) {
                    WinActivate
                    return true
                }
                
                if (currentTitle == originalTitle || tabCount > 50) {
                    break
                }
            } else {
                ToolTip "Browser window lost focus. Total tabs counted: " . tabCount
                SetTimer () => ToolTip(), -5000
                return false
            }
        }
    }
}

ToolTip "No supported browser found or target URL not found"
SetTimer () => ToolTip(), -5000
return false
}
SendWhatsAppMessage(phoneNumber, message) {
; Replace spaces with '%20' in the message
encodedMessage := StrReplace(StrReplace(message, " ", "%20"), "`n", "%0A")

; Construct the WhatsApp Web URL
wtsapp := 'https://web.whatsapp.com/send?phone=+91' . phoneNumber . '&text=' . encodedMessage

appsName := "chrome.exe"
if ProcessExist(appsName) {
WinActivate "ahk_exe " . appsName
Run 'chrome.exe ' . wtsapp
WinWaitActive 'WhatsApp'
Sleep 10000
SendEvent "{Blind}{Enter}"
} else {
; Open the URL in Chrome
Run 'chrome.exe ' . wtsapp
WinWaitActive 'WhatsApp'
Sleep 10000
SendEvent "{Blind}{Enter}"
}
}
; Create the GUI
MyWa := Gui()
MyWa.Title := "WhatsApp Message Sender"

; Add input boxes and labels
MyWa.Add("Text", "x10 y10 w120", "WhatsApp Number:")
MyWa.Add("Edit", "x10 y30 w200 vPhoneNumber")

MyWa.Add("Text", "x10 y60 w120", "Message:")
MyWa.Add("Edit", "x10 y80 w200 h60 vMessage")

; Add a submit button
submitBtn := MyWa.Add("Button", "x10 y150 w100", "Send")
submitBtn.OnEvent("Click", SendMessage)

; Show the GUI
wa_send(){
MyWa.Show()
}
; Function to handle the submit button click
SendMessage(*) {
enteredPhoneNumber := MyWa['PhoneNumber'].Value
enteredMessage := MyWa['Message'].Value

; Call the function to send WhatsApp message
SendWhatsAppMessage(enteredPhoneNumber, enteredMessage)
}
CopyFileContent() {
A_Clipboard := ""  ; Clear the clipboard
Send "^c"
ClipWait 2
if (A_Clipboard != "") {
    if (FileExist(A_Clipboard)) {
        try {
            fileContent := FileRead(A_Clipboard)
            ; MsgBox fileContent
            A_Clipboard := fileContent
            ToolTip("File content copied to clipboard successfully.")
            SetTimer () => ToolTip(), -5000  ; Hides the tooltip after 5 seconds
        } catch as err {
            MsgBox "Error reading file: " . err.Message
        }
    } else {
        MsgBox "Clipboard content is not a valid file path."
    }
} else {
    MsgBox "No content was copied to the clipboard."
}
}
;;================= ˅˅˅˅ news functions ˅˅˅˅ ==============
general_news(){
copy2clip()
Run "https://news.google.com/search?q=" . A_Clipboard
Run "https://www.bbc.com/search?q=" . A_Clipboard
Run "https://edition.cnn.com/search?q=" . A_Clipboard
Run "https://www.nytimes.com/search?query=" . A_Clipboard
Run "https://www.reuters.com/site-search/?query=" . A_Clipboard
Run "https://timesofindia.indiatimes.com/topic/" . A_Clipboard
Run "https://www.hindustantimes.com/topic/" . A_Clipboard
Run "https://www.ndtv.com/search?searchtext=" . A_Clipboard
}
Technology_News(){
copy2clip()
Run "https://news.google.com/search?q=" . A_Clipboard
Run "https://techcrunch.com/?s=" . A_Clipboard
Run "https://www.wired.com/search/?q=" . A_Clipboard
Run "https://www.theverge.com/search?q=" . A_Clipboard
Run "https://www.gadgets360.com/search?searchtext=" . A_Clipboard
Run "https://www.firstpost.com/tag/" . A_Clipboard
}
Financial_News(){
    copy2clip()
    Run "https://news.google.com/search?q=" . A_Clipboard
    Run "https://www.bloomberg.com/search?query=" . A_Clipboard
    Run "https://www.wsj.com/search?query=" . A_Clipboard
    Run "https://www.ft.com/search?q=" . A_Clipboard
    Run "https://www.google.com/search?q=" . A_Clipboard . " site:https://economictimes.indiatimes.com/"
    Run "https://www.google.com/search?q=" . A_Clipboard . " site:www.moneycontrol.com"
}
Science_News(){
    copy2clip()
    Run "https://news.google.com/search?q=" . A_Clipboard
    Run "https://www.sciencedaily.com/search/?keyword=" . A_Clipboard
    Run "https://www.nature.com/search?q=" . A_Clipboard
    Run "https://www.sciencenews.org/?s=" . A_Clipboard
    Run "https://www.thehindu.com/search/#gsc.tab=0&gsc.q=" . A_Clipboard    
}
World_News(){
    copy2clip()
    Run "https://www.aljazeera.com/search/" . A_Clipboard
    Run "https://www.google.com/search?q=" . A_Clipboard . " site:www.theguardian.com"
    Run "https://www.bbc.co.uk/search?q=" . A_Clipboard . '&edgeauth=eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJrZXkiOiAiZmFzdGx5LXVyaS10b2tlbi0xIiwiZXhwIjogMTcyMTIxMjIzNSwibmJmIjogMTcyMTIxMTg3NSwicmVxdWVzdHVyaSI6ICIlMkZzZWFyY2glM0ZxJTNEbW9kaSJ9.KNiu7MlaE4X2pSi7oH22yYzS-4aBqn1MjZDiJGoONkY'
    Run "https://www.indiatoday.in/search/" . A_Clipboard
    Run "https://www.google.co.in/search?q=" . A_Clipboard . " site:https://indianexpress.com"    
}
Social_Media_News(){
    copy2clip()
    Run "https://www.facebook.com/search/top/?q=" . A_Clipboard
    Run "https://x.com/search?q=" . A_Clipboard . "&src=typed_query&f=top"
    Run "https://www.reddit.com/search/?q=" . A_Clipboard
    Run "https://news.google.com/search?q=" . A_Clipboard . "&hl=en-IN&gl=IN&ceid=IN%3Aen"
    Run "https://www.youtube.com/results?search_query=" . A_Clipboard .  "_News" . "&sp=EgIIAg%253D%253D"
; Run "https://www.linkedin.com/search/results/all/?keywords=" . A_Clipboard
}
;;================= ^^^^ news search functions ^^^^ ==============


;;================= ˅˅˅˅ social media search functions ˅˅˅˅ ==============

Social_Media(){
    copy2clip()
    Run "https://www.facebook.com/search/top/?q=" . A_Clipboard
; Run "https://www.linkedin.com/search/results/all/?keywords=" . A_Clipboard
    Run "https://x.com/search?q=" . A_Clipboard . "&src=typed_query&f=top"
    Run "https://www.reddit.com/search/?q=" . A_Clipboard
    Run "https://www.youtube.com/results?search_query=" . A_Clipboard
}
;;================= ^^^^ social media search functions ^^^^ ==============


;;================= ˅˅˅˅ Online shopping search functions ˅˅˅˅ ==============
Electronics(){
    copy2clip()
    Run "https://www.flipkart.com/search?q=" . A_Clipboard
    Run "https://www.amazon.in/s?k=" . A_Clipboard
    Run "https://www.tatacliq.com/search/?searchCategory=all&text=" . A_Clipboard
}
Fashion(){
    copy2clip()
    Run 'https://www.myntra.com/' . A_Clipboard . '?rawQuery=' . A_Clipboard
    Run 'https://www.ajio.com/search/?text=' . A_Clipboard
    Run 'https://www.amazon.in/s?k=' . A_Clipboard
    Run 'https://www.flipkart.com/search?q=' . A_Clipboard
}
Home_furniture(){
    copy2clip()
    Run 'https://www.pepperfry.com/site_product/search?q=' . A_Clipboard
    Run 'https://www.amazon.in/s?k=' . A_Clipboard
    Run 'https://www.flipkart.com/search?q=' . A_Clipboard
}
Groceries(){
    copy2clip()
Run 'https://www.bigbasket.com/ps/?q=' . A_Clipboard
Run 'https://www.amazon.in/s?k=' . A_Clipboard
Run 'https://www.flipkart.com/search?q=' . A_Clipboard
}
Beauty_Wellness(){
    copy2clip()
Run 'https://www.amazon.in/s?k=' . A_Clipboard
Run 'https://www.flipkart.com/search?q=' . A_Clipboard    
}
Books(){
    copy2clip()
Run 'https://www.amazon.in/s?k=' . A_Clipboard
Run 'https://www.flipkart.com/search?q=' . A_Clipboard    
}
Sports_Fitness(){
    copy2clip()
Run 'https://www.amazon.in/s?k=' . A_Clipboard
Run 'https://www.flipkart.com/search?q=' . A_Clipboard    
}
Toys_Baby_Products(){
    copy2clip()
Run 'https://www.amazon.in/s?k=' . A_Clipboard
Run 'https://www.flipkart.com/search?q=' . A_Clipboard
}
;;================= ^^^^ Online shopping search functions ^^^^ ==============

; googlesearch action for > selected text/non selected text 
; run > url with clip or run url with out clip
Runurl(urlclip,url){
    ClipSaved := ClipboardAll ; Save the current clipboard content
    A_Clipboard:=""
    Send "^c" ; Copy selected text
    ClipWait(3,1) ; timeout in 3sec and Wait for 1 sec to clipboard update
    Run (A_Clipboard ? urlclip . A_Clipboard : url) ; run url with clip or run url with out clip ; Ternary operator method: IsSet(A) ? A : B
    ClipSaved := A_Clipboard
}

;;=================> Dark Mode ==============
;; got the dark mode solution from https://www.reddit.com/user/DepthTrawler/
SetPreferredAppMode()
; Build the menu, then call FlushMenuThemes
FlushMenuThemes()

AppsUseLightTheme() {
        keyName := "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        valueName := "AppsUseLightTheme"
        return RegRead(keyName, valueName)
}

SetPreferredAppMode(option := ""){
        static options := Map()
        if !options.Count {
                options.CaseSense := false
                options.Set(
                        "Default", 0,
                        "AllowDark", 1,
                        "ForceDark", 2,
                        "ForceLight", 3,
                        "Max", 4
                )
                options.Default := !AppsUseLightTheme()
        }
        hModule := DllCall("kernel32.dll\GetModuleHandle", "str", "uxtheme.dll", "ptr")
        ; These are undocumented functions. They must be called via ordinal.
        SetPreferredAppMode := DllCall("kernel32.dll\GetProcAddress", "ptr", hModule, "ptr", 135, "ptr")
        DllCall(SetPreferredAppMode, "int", options.Get(option))
        DllCall("kernel32.dll\FreeLibrary", "ptr", hModule)
}       

FlushMenuThemes() {
    hModule := DllCall("kernel32.dll\GetModuleHandle", "str", "uxtheme.dll", "ptr")
    ; Undocumented functions must be called via ordinal.
    FlushMenuThemes := DllCall("kernel32.dll\GetProcAddress", "ptr", hModule, "ptr", 136, "ptr")
    DllCall(FlushMenuThemes)
    DllCall("kernel32.dll\FreeLibrary", "ptr", hModule)
}
