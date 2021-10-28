#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
SetTitleMatchMode, 2
DetectHiddenWindows, On
CoordMode, ToolTip, Screen
SetKeyDelay, 10, 10

Menu, Tray, NoStandard
Menu, Tray, Add, Exit, GuiClose

Gui, Font, w700 s12, Bahnschrift
Gui, Add, Text,, Screen Recording
Gui, Font

Gui, Add, Text,, Output File Path:
Gui, Add, Edit, w200 vrec_out_path
Gui, Add, Button, Default w80 h25 gRecordingOutputFile, Choose File

Gui, Add, CheckBox, vcom_hotkey_toggle gRecordingHotkeyToggle, Enable Hotkeys
Gui, Add, Text, vcom_hotkey_text1 +Disabled, Start Recording Hotkey:
Gui, Add, Hotkey, Limit1 vrec_starthot gRecordingHotkey +Disabled, ^+F10
Gui, Add, Text, vcom_hotkey_text2 +Disabled, Stop Recording Hotkey:
Gui, Add, Hotkey, Limit1 vrec_stophot gRecordingHotkey +Disabled, ^+F12

Gui, Add, CheckBox, vrec_microphone gRecordingMicrophone, Record Microphone

Gui, Add, CheckBox, vrec_desktop_audio gRecordingDesktopAudio, Record Dekstop Audio

Gui, Add, Text,, Framerate (FPS):
Gui, Add, Slider, w200 ToolTipBottom Range1-60 vrec_fps, 30

Gui, Add, Text,, Volume Boost (in dB):
Gui, Add, Slider, w200 ToolTipBottom Range-15-15 vrec_volume, 0

Gui, Add, Button, Default w120 h30 gScreenRecording vrec_button, Record your screen

Gui, Font, s10
Gui, Add, Text, ym y44, Advanced Options: `n(Default Recommended)
Gui, Font

Gui, Add, Text,, Video Quality: `n(0 - highest <> 51 - lowest)
Gui, Add, Slider, w200 ToolTipBottom Range0-51 vrec_quality, 22

Gui, Add, Text,, Video Capture:
Gui, Add, ListBox, w80 h30 vrec_capture, Desktop||Active Game

Gui, Add, Text,, Video Encoder:
Gui, Add, ListBox, w80 h80 vrec_encoder, libx265||h264_nvenc|hevc_nvenc|h264_amf|hevc_amf

Gui, Add, Text,, Output File Extension:
Gui, Add, ComboBox, w80 vrec_ext, mp4||mkv|mov

; ========================

Gui, Font, w700 s12, Bahnschrift
Gui, Add, Text, ym, Video Compression
Gui, Font

Gui, Add, Text,, Input File Path:
Gui, Add, Edit, w200 vcom_in_path gCompressionInputLenght
Gui, Add, Button, Default w80 h25 gCompressionInputFile, Choose File

Gui, Add, Text,, Output File Path:
Gui, Add, Edit, w200 vcom_out_path
Gui, Add, Button, Default w80 h25 gCompressionOutputFile, Choose File

Gui, Font, s10
Gui, Add, Text,, Advanced Options: `n(Default Recommended)
Gui, Font

Gui, Add, CheckBox, vcom_cut_toggle gCompressionCut, Cut the Video
Gui, Add, Text, vcom_cuttext1 +Disabled, Start:
Gui, Add, DateTime, x+9 y+-16 w80 Choose20200731000000 vcom_cutstart gCalculateOutputLenght +Disabled, HH:mm:ss
Gui, Add, CheckBox, x+-114 y+9 vcom_cut_endtoggle gCompressionCutEnd Checked +Disabled, To the End
Gui, Add, Text, vcom_cuttext2 +Disabled, Stop:
Gui, Add, DateTime, x+9 y+-16 w80 Choose20200731000000 vcom_cutstop gCalculateOutputLenght +Disabled, HH:mm:ss

Gui, Add, Text, x+-114 y+9 vcom_text_volume, Volume Boost (in dB):
Gui, Add, Slider, w200 ToolTipBottom Range-15-15 vcom_volume, 0

Gui, Add, CheckBox, vcom_speed_toggle gCompressionSpeed, Change Speed
Gui, Add, Text,, (This will disable the audio)
Gui, Add, ComboBox, w80 vcom_speed +Disabled gCalculateOutputLenght, 0.5|1||1.5|2|5|10|20

Gui, Add, Button, Default w80 h30 gVideoCompression, Compress

Gui, Add, CheckBox, ym y45 gCompressionScaling vcom_scale_toggle, Scale Video
Gui, Add, DropDownList, w80 vcom_scale +Disabled, 144p|240p|360p|480p|720p||1080p|1440p|2160p

Gui, Add, Text, x+-81 y+9 vcom_text_quality, Video Quality: `n(0 - highest <> 51 - lowest)
Gui, Add, Slider, w200 ToolTipBottom Range0-51 vcom_quality, 22

Gui, Add, Text, vcom_text_audio_bitrate, Audio Bitrate:
Gui, Add, DropDownList, w60 vcom_audio_bitrate, 32k|64k|96k|128k|160k|192k||224k|256k|288k|320k

Gui, Add, CheckBox, vcom_bitrate_toggle gCompressionBitrate, Change Bitrate Instead
Gui, Add, Text, vcom_text_filesize +Disabled, Target File Size:
Gui, Add, Edit, x+9 y+-16 w50 vcom_edit_filesize +Disabled
Gui, Add, UpDown, vcom_filesize Range1-1000000, 25
Gui, Add, Text, x+4 y+-18 vcom_text_MB +Disabled, MB
Gui, Add, Text, x+-155 y+14 vcom_text_filelenght +Disabled, Output File Lenght:
Gui, Add, DateTime, x+9 y+-16 w80 Choose20200731000100 vcom_filelenght +Disabled, HH:mm:ss
Gui, Add, Edit, x+-179 y+9 w80 vcom_bitrate +Disabled, 2500
Gui, Add, Button, x+9 y+-22 Default +Disabled w80 h40 vcom_bitrate_button gCalculateCompressionBitrate, Calculate Bitrate

Gui, Add, CheckBox, x+-169 y+5 vcom_2pass, 2 Pass Encoding

Gui, Add, CheckBox, vcom_fps_toggle gCompressionFPS, Change Framerate
Gui, Add, Slider, w200 ToolTipBottom Range15-60 vcom_fps +Disabled, 30

Gui, Add, Text,, Output File Extension:
Gui, Add, ComboBox, w80 vcom_ext, mp4||mkv|mov

Gui, Add, Text,, Video Encoder:
Gui, Add, ListBox, w80 h80 vcom_encoder, libx265||h264_nvenc|hevc_nvenc|h264_amf|hevc_amf

; ========================

Gui, Font, w700 s12, Bahnschrift
Gui, Add, Text, ym, Video Concatenation
Gui, Font

Gui, Add, Text,, Input Files:
Gui, Add, Edit, w200 h120 vconcat_in_path ReadOnly
Gui, Add, Button, Default w80 h25 gConcatenationInputFiles, Choose Files

Gui, Add, Text,, Output File Path:
Gui, Add, Edit, w200 vconcat_out_path
Gui, Add, Button, Default w80 h25 gConcatenationOutputFile, Choose File

Gui, Add, Text,, Output File Extension:
Gui, Add, ComboBox, w80 vconcat_ext, mp4||mkv|mov|avi|mp3|wav

Gui, Add, Button, Default w80 h30 gConcatenationSubmit, Concatenate

; =---=---=---=---=---=---=---=---=---=---=---=---=---=---=---=---=
; Gui, Font, w700 s12, Bahnschrift
; Gui, Add, CheckBox, vffmpeg_showcmd, Show Output Command
; Gui, Font
; =---=---=---=---=---=---=---=---=---=---=---=---=---=---=---=---=

Run, %ComSpec% /c "ffmpeg.exe",, Hide

Gui, Show,, Simple Studio

Return

; ========================

RemoveToolTip:
    ToolTip
Return

RecordingOutputFile:
    FormatTime, output_filename,, ddMMMyyyy [HH.mm.ss]
    FileSelectFile, rec_out_path, S,%output_filename%, Simple Studio - Output file path, Videos (*.mp4; *.mkv; *.mov)
    GuiControl,, rec_out_path, %rec_out_path%
Return

GuiUnhide:
    Gui, Show
Return

RecordingMicrophone:
    GuiControlGet, rec_microphone
    if (rec_microphone){
        list_devices = 1
        GuiControl, Disable, rec_button
        Run, %ComSpec%,, Hide, ffmpeg_devicelist_PID
        WinWait, ahk_pid %ffmpeg_devicelist_PID%
        ClipTemp := ClipboardAll
        Sleep, 100
        Clipboard := "ffmpeg.exe -list_devices true -f dshow -i dummy"
        Sleep, 50
        ControlSend,, ^v{Enter}
        Sleep, 1000
        ControlSend,, ^a^c
        Sleep, 50
        WinClose

        ffmpeg_devicelist := Clipboard

        Sleep, 50
        Clipboard := ClipTemp

        quote_sign = "

        ffmpeg_audio_startpos = % InStr(ffmpeg_devicelist, "DirectShow audio devices", 1) + 24
        ffmpeg_audio_1stquote = % InStr(ffmpeg_devicelist, quote_sign,, ffmpeg_audio_startpos)
        ffmpeg_audio_2ndquote = % InStr(ffmpeg_devicelist, quote_sign,, ffmpeg_audio_startpos, 2)
        ffmpeg_audio_len := ffmpeg_audio_2ndquote - ffmpeg_audio_1stquote - 1

        ffmpeg_microphone = % SubStr(ffmpeg_devicelist, ffmpeg_audio_1stquote + 1, ffmpeg_audio_len)
        if (ffmpeg_microphone == ""){
            GuiControl,, rec_microphone, 0
            MsgBox,, Simple Studio, Attaching the microphone failed!
        }
        list_devices = 0
    }
    if (!list_devices2)
        GuiControl, Enable, rec_button
Return

RecordingDesktopAudio:
    GuiControlGet, rec_desktop_audio
    if (rec_desktop_audio){
        list_devices2 = 1
        GuiControl, Disable, rec_button
        Run, %ComSpec%,, Hide, ffmpeg_devicelist2_PID
        WinWait, ahk_pid %ffmpeg_devicelist2_PID%
        ClipTemp := ClipboardAll
        Sleep, 100
        Clipboard := "ffmpeg.exe -list_devices true -f dshow -i dummy"
        Sleep, 50
        ControlSend,, ^v{Enter}
        Sleep, 1000
        ControlSend,, ^a^c
        Sleep, 50
        WinClose

        ffmpeg_devicelist2 := Clipboard

        Sleep, 50
        Clipboard := ClipTemp

        quote_sign = "

        ffmpeg_desktop_audio_bool = % InStr(ffmpeg_devicelist2, "virtual-audio-capturer", 1)
        if (!ffmpeg_desktop_audio_bool){
            GuiControl,, rec_desktop_audio, 0
            MsgBox,, Simple Studio, Couldn't attach desktop audio!
        }
        list_devices2 = 0
    }
    if (!list_devices)
        GuiControl, Enable, rec_button
Return

RecordingHotkeyToggle:
    GuiControlGet, com_hotkey_toggle
    if (com_hotkey_toggle){
        GuiControl, Enable, com_hotkey_text1
        GuiControl, Enable, rec_starthot
        GuiControl, Enable, com_hotkey_text2
        GuiControl, Enable, rec_stophot
        Gosub, RecordingHotkey
    }
    else{
        GuiControl, Disable, com_hotkey_text1
        GuiControl, Disable, rec_starthot
        GuiControl, Disable, com_hotkey_text2
        GuiControl, Disable, rec_stophot
    }
Return

RecordingHotkey:
    rec_hotkeychange = 1
    GuiControlGet, rec_starthot
    GuiControlGet, rec_stophot
    if (rec_starthot == "")
        rec_starthot = ^+F10
    if (rec_stophot == "")
        rec_stophot = ^+F12
    if (rec_starthot != rec_starthot_old){
        if (rec_starthot_old != "")
            Hotkey, %rec_starthot_old%, Off
        Hotkey, %rec_starthot%, ScreenRecordingWHotkey, On
        rec_starthot_old := rec_starthot
    }
    if (rec_stophot != rec_stophot_old){
        if (rec_stophot_old != "")
            Hotkey, %rec_stophot_old%, Off
        Hotkey, %rec_stophot%, StopRecordingWHotkey, On
        rec_stophot_old := rec_stophot
    }
    GuiControl,, rec_starthot, %rec_starthot%
    GuiControl,, rec_stophot, %rec_stophot%
    rec_hotkeychange = 0
Return

ScreenRecordingWHotkey:
    if (recording or rec_hotkeychange or !com_hotkey_toggle)
        Return
    rec_whotkey = 1
    rec_ans = 1
ScreenRecording:
    GuiControlGet, rec_out_path
    if (rec_out_path == ""){
        MsgBox,, Simple Studio, Wrong Output File Path!
        Return
    }
    if (!rec_whotkey){
        MsgBox, 4, Simple Studio, Do you want to start recording the screen?
        IfMsgBox, Yes
            rec_ans = 1
    }
    if (rec_ans){
        Gui, Submit

        video_smoothener = -probesize 20M -thread_queue_size 1024 -rtbufsize 150M
        audio_smoothener = -probesize 20M -thread_queue_size 1024 -rtbufsize 20M

        if (rec_microphone)
            ffmpeg_microphone_input = -f dshow %audio_smoothener% -i audio=`"%ffmpeg_microphone%`"
        if (rec_desktop_audio)
            ffmpeg_desktop_audio_input = -f dshow %audio_smoothener% -i audio=`"virtual-audio-capturer`"
        if (rec_microphone and rec_desktop_audio)
            ffmpeg_double_audio = -filter_complex amix=inputs=2:duration=shortest,volume=%rec_volume%dB
        if (rec_microphone or rec_desktop_audio)
            ffmpeg_audio_codec = -c:a aac -b:a 192k -ac 1

        if (rec_capture == "Desktop")
            rec_capture_method = -video_size %A_ScreenWidth%x%A_ScreenHeight% %video_smoothener% -i desktop
        else if (rec_capture == "Active Game"){
            WinGetActivetitle, win_Atitle
            rec_capture_method = %video_smoothener% -i title=`"%win_Atitle%`"
        }

        if (rec_encoder == "libx265")
            rec_encoder_full = libx265 -preset ultrafast -tune zerolatency -crf %rec_quality% -pix_fmt yuv420p
        else if (rec_encoder == "h264_nvenc" or rec_encoder == "hevc_nvenc")
            rec_encoder_full = %rec_encoder% -preset llhq -qp %rec_quality%
        else if (rec_encoder == "h264_amf" or rec_encoder == "hevc_amf")
            rec_encoder_full = %rec_encoder% -usage ultralowlatency -rc cqp -qp_i %rec_quality% -qp_p %rec_quality% -qp_b %rec_quality%

        ffmpeg_recording = ffmpeg.exe -hwaccel auto %ffmpeg_microphone_input% %ffmpeg_desktop_audio_input% %ffmpeg_double_audio% -f gdigrab -framerate %rec_fps% %rec_capture_method% -r %rec_fps% -c:v %rec_encoder_full% %ffmpeg_audio_codec% -y `"%rec_out_path%.%rec_ext%`"
        SoundPlay, %A_WinDir%\Media\Speech On.wav
        
        if (ffmpeg_showcmd){
            Clipboard := ffmpeg_recording
            MsgBox,, Simple Studio, %ffmpeg_recording%
            ExitApp
            Return
        }
        
        Run %ComSpec% /c `"%ffmpeg_recording%`",, Hide, rec_PID
        
        recording = 1
        Menu, Tray, Delete, Exit
        Menu, Tray, Add, &Stop Recording, StopRecording
        WinWait, ahk_pid %rec_PID%
        WinWaitClose
        if (!ErrorLevel and recording){
            MsgBox,, Simple Studio, Something went wrong!
            Run, %A_ScriptFullPath%
        }
    }
Return

StopRecordingWHotkey:
    if (!com_hotkey_toggle)
        Return
StopRecording:
    if (!recording)
        Return
    recording = 0
    ControlSend,, q, ahk_pid %rec_PID%
    SoundPlay, %A_WinDir%\Media\Speech Off.wav
    Sleep, 500
    Run %COMSPEC% /c explorer.exe /select`, `"%rec_out_path%.%rec_ext%`",, Hide
    Run, %A_ScriptFullPath%
Return

; ========================

CompressionInputFile:
    FileSelectFile, com_in_path, 3,, Simple Studio - Input file path, Videos (*.mp4; *.mkv; *.mov)
    GuiControl,, com_in_path, %com_in_path%
    if (com_in_path == "")
        Return
CompressionInputLenght:
    GuiControlGet, com_in_path
    Run, %ComSpec%,, Hide, ffmpeg_inlen_PID
    WinWait, ahk_pid %ffmpeg_inlen_PID%
    ClipTemp := ClipboardAll
    Sleep, 100
    Clipboard = ffmpeg.exe -i `"%com_in_path%`"
    Sleep, 50
    ControlSend,, ^v{Enter}
    Sleep, 1000
    ControlSend,, ^a^c
    Sleep, 50
    WinClose

    ffmpeg_in_info := Clipboard

    Sleep, 50
    Clipboard := ClipTemp

    ffmpeg_inlen_startpos = % InStr(ffmpeg_in_info, "Duration: ", 1) + 10
    ffmpeg_inlen_delimiterpos = % InStr(ffmpeg_in_info, ",",, ffmpeg_inlen_startpos)
    ffmpeg_inlen_len := ffmpeg_inlen_delimiterpos - ffmpeg_inlen_startpos - 1

    ffmpeg_inlen = % SubStr(ffmpeg_in_info, ffmpeg_inlen_startpos, ffmpeg_inlen_len)
    ffmpeg_inlen_wodel = % SubStr(ffmpeg_inlen, 1, 2) . SubStr(ffmpeg_inlen, 4, 2) . SubStr(ffmpeg_inlen, 7, 2)
    ffmpeg_inlen_seconds := 3600 * SubStr(ffmpeg_inlen, 1, 2) + 60 * SubStr(ffmpeg_inlen, 4, 2) + SubStr(ffmpeg_inlen, 7, 2) + SubStr(ffmpeg_inlen, 10, 1) / 10
    GuiControl,, com_filelenght, 20200731%ffmpeg_inlen_wodel%
Return

CompressionOutputFile:
    FormatTime, output_filename,, ddMMMyyyy [HH.mm.ss]
    FileSelectFile, com_out_path, S,%output_filename%, Simple Studio - Output file path, Videos (*.mp4; *.mkv; *.mov)
    GuiControl,, com_out_path, %com_out_path%
Return

CompressionCut:
    GuiControlGet, com_cut_toggle
    GuiControlGet, com_cut_endtoggle
    if (com_cut_toggle){
        GuiControl, Enable, com_cuttext1
        GuiControl, Enable, com_cutstart
        GuiControl, Enable, com_cut_endtoggle
        if (!com_cut_endtoggle){
            GuiControl, Enable, com_cuttext2
            GuiControl, Enable, com_cutstop
        }
    }
    else{
        GuiControl, Disable, com_cuttext1
        GuiControl, Disable, com_cutstart
        GuiControl, Disable, com_cut_endtoggle
        GuiControl, Disable, com_cuttext2
        GuiControl, Disable, com_cutstop
    }
Return

CompressionCutEnd:
    GuiControlGet, com_cut_endtoggle
    if (!com_cut_endtoggle){
        GuiControl, Enable, com_cuttext2
        GuiControl, Enable, com_cutstop
    }
    else{
        GuiControl, Disable, com_cuttext2
        GuiControl, Disable, com_cutstop
    }
Return

CompressionFPS:
    GuiControlGet, com_fps_toggle
    if (com_fps_toggle)
        GuiControl, Enable, com_fps
    else
        GuiControl, Disable, com_fps
Return

CompressionSpeed:
    GuiControlGet, com_speed_toggle
    if (com_speed_toggle){
        GuiControl, Enable, com_speed
        GuiControl, Disable, com_text_volume
        GuiControl, Disable, com_volume
        GuiControl, Disable, com_text_audio_bitrate
        GuiControl, Disable, com_audio_bitrate
    }
    else{
        GuiControl, Disable, com_speed
        GuiControl, Enable, com_text_volume
        GuiControl, Enable, com_volume
        GuiControl, Enable, com_text_audio_bitrate
        GuiControl, Enable, com_audio_bitrate
    }
Return

CompressionScaling:
    GuiControlGet, com_scale_toggle
    if (com_scale_toggle)
        GuiControl, Enable, com_scale
    else
        GuiControl, Disable, com_scale
Return

CalculateOutputLenght:
    GuiControlGet, com_speed
    GuiControlGet, com_cut_toggle
    GuiControlGet, com_cut_endtoggle
    GuiControlGet, com_cutstart
    GuiControlGet, com_cutstop
    if (com_cut_toggle){
        ffmpeg_cutstart_seconds = % 3600 * SubStr(com_cutstart, 9, 2) + 60 * SubStr(com_cutstart, 11, 2) + SubStr(com_cutstart, 13, 2)
        if (!com_cut_endtoggle){
            ffmpeg_cutstop_seconds = % 3600 * SubStr(com_cutstop, 9, 2) + 60 * SubStr(com_cutstop, 11, 2) + SubStr(com_cutstop, 13, 2)
            ffmpeg_outlen_seconds := (ffmpeg_cutstop_seconds - ffmpeg_cutstart_seconds)
        }
        else
            ffmpeg_outlen_seconds := (ffmpeg_inlen_seconds - ffmpeg_cutstart_seconds)
    }
    else
        ffmpeg_outlen_seconds := ffmpeg_inlen_seconds / com_speed

    f_o_hours := Floor(ffmpeg_outlen_seconds / 3600)
    f_o_minutes := Floor((ffmpeg_outlen_seconds - 3600 * f_o_hours) / 60)
    f_o_seconds := Floor(ffmpeg_outlen_seconds - 3600 * f_o_hours - 60 * f_o_minutes)
    if (f_o_hours < 10)
        f_o_hours = 0%f_o_hours%
    if (f_o_minutes < 10)
        f_o_minutes = 0%f_o_minutes%
    if (f_o_seconds < 10)
        f_o_seconds = 0%f_o_seconds%
    ffmpeg_outlen_wodel = % f_o_hours . f_o_minutes . f_o_seconds
    GuiControl,, com_filelenght, 20200731%ffmpeg_outlen_wodel%
Return

CalculateCompressionBitrate:
    GuiControlGet, com_filesize
    GuiControlGet, com_filelenght
    GuiControlGet, com_audio_bitrate
    GuiControlGet, com_speed_toggle
    com_hours = % SubStr(com_filelenght, 9, 2)
    com_minutes = % SubStr(com_filelenght, 11, 2)
    com_seconds = % SubStr(com_filelenght, 13, 2)
    com_calc_audio_bitrate = % SubStr(com_audio_bitrate, 1, InStr(com_audio_bitrate, "k") - 1) * !com_speed_toggle
    com_bitrate := (com_filesize) * 8000 / (3600 * com_hours + 60 * com_minutes + com_seconds) - com_calc_audio_bitrate
    GuiControl,, com_bitrate, %com_bitrate%
Return

CompressionBitrate:
    GuiControlGet, com_bitrate_toggle
    if (com_bitrate_toggle){
        GuiControl, Enable, com_bitrate
        GuiControl, Enable, com_text_filesize
        GuiControl, Enable, com_edit_filesize
        GuiControl, Enable, com_text_MB
        GuiControl, Enable, com_text_filelenght
        GuiControl, Enable, com_filelenght
        GuiControl, Enable, com_bitrate_button
        GuiControl, Disable, com_quality
        GuiControl, Disable, com_text_quality
    }
    else{
        GuiControl, Disable, com_bitrate
        GuiControl, Disable, com_text_filesize
        GuiControl, Disable, com_edit_filesize
        GuiControl, Disable, com_text_MB
        GuiControl, Disable, com_text_filelenght
        GuiControl, Disable, com_filelenght
        GuiControl, Disable, com_bitrate_button
        GuiControl, Enable, com_quality
        GuiControl, Enable, com_text_quality
    }
Return

VideoCompression:
    GuiControlGet, com_in_path
    GuiControlGet, com_out_path
    if (com_in_path == "" or com_out_path == ""){
        MsgBox,, Simple Studio, Wrong Input or Output File Path!
        Return
    }
    MsgBox, 4, Simple Studio, Do you want to start the compression?
    IfMsgBox, Yes
        com_ans = 1
    if (com_ans){
        Gui, Submit, NoHide

        if (com_fps_toggle){
            com_framerate = -r %com_fps%
        }

        if (com_encoder == "libx265"){
            com_encoder_full = libx265 -preset medium
        }
        else if (com_encoder == "h264_nvenc" or com_encoder == "hevc_nvenc"){
            com_encoder_full = %com_encoder% -preset hq
        }
        else if (com_encoder == "h264_amf" or com_encoder == "hevc_amf"){
            com_encoder_full = %com_encoder%
        }

        if (com_bitrate_toggle){
            com_enc_rate = -b:v %com_bitrate%k
        }
        else{
            if (com_encoder == "libx265"){
                com_enc_rate = -crf %com_quality%
            }
            else if (com_encoder == "h264_nvenc" or com_encoder == "hevc_nvenc"){
                com_enc_rate = -qp %com_quality%
            }
            else if (com_encoder == "h264_amf" or com_encoder == "hevc_amf"){
                com_enc_rate = -rc cqp -qp_i  %com_quality% -qp_p  %com_quality% -qp_b  %com_quality%
            }
        }
        
        if (com_speed_toggle){
            com_speed_div := 1 / com_speed
            com_speed_filter = setpts=%com_speed_div%*PTS
            com_audio_codec = -an
            com_complex_filter = -filter_complex %com_speed_filter%
        }
        else
            com_audio_codec = -filter:a `"volume=%com_volume%dB`" -c:a aac -b:a %com_audio_bitrate%

        if (com_scale_toggle){
            com_scale_ppos = % InStr(com_scale, "p") - 1
            com_scale_resolution = % SubStr(com_scale, 1, com_scale_ppos)
            com_scale_filter = scale=-1:%com_scale_resolution%
            if (com_complex_filter != "")
                com_complex_filter = %com_complex_filter%,%com_scale_filter%
            else
                com_complex_filter = -filter_complex %com_scale_filter%
        }

        if (com_cut_toggle){
            com_cutstart_RSS = % SubStr(com_cutstart, 9, 2) ":" SubStr(com_cutstart, 11, 2) ":" SubStr(com_cutstart, 13, 2)
            com_cutstop_RSS = % SubStr(com_cutstop, 9, 2) ":" SubStr(com_cutstop, 11, 2) ":" SubStr(com_cutstop, 13, 2)
            if (!com_cut_endtoggle)
                com_cut_full = -ss %com_cutstart_RSS% -to %com_cutstop_RSS% -async 1
            else
                com_cut_full = -ss %com_cutstart_RSS% -async 1
        }

        if (com_2pass){
            ffmpeg_compression_1stpass = ffmpeg.exe -y -i `"%com_in_path%`" %com_complex_filter% %com_cut_full% -c:v %com_encoder_full% %com_enc_rate% -pass 1 %com_framerate% %com_audio_codec% -y -f %com_ext% NUL && ^
            ffmpeg_compression_2ndpass = ffmpeg.exe -i `"%com_in_path%`" %com_complex_filter% %com_cut_full% -c:v %com_encoder_full% %com_enc_rate% -pass 2 %com_framerate% %com_audio_codec% -y `"%com_out_path%.%com_ext%`"
            
            if (ffmpeg_showcmd){
                Clipboard := ffmpeg_compression_1stpass
                MsgBox,, Simple Studio, %ffmpeg_compression_1stpass%
                Clipboard := ffmpeg_compression_2ndpass
                MsgBox,, Simple Studio, %ffmpeg_compression_2ndpass%
                ExitApp
                Return
            }
            
            ClipTemp := ClipboardAll
            Run %ComSpec%,,, com_PID
            Sleep, 100
            WinWait, ahk_pid %com_PID%
            Clipboard := ffmpeg_compression_1stpass
            Sleep, 50
            ControlSend,, ^v{Enter}
            Clipboard := ffmpeg_compression_2ndpass
            Sleep, 50
            ControlSend,, ^v{Enter}
            Clipboard := ClipTemp
            Loop {
                Sleep, 1000
                ControlSend,, exit{Enter}
                WinWaitClose,,, 0.5
                if (!ErrorLevel)
                    Break
            }
        }
        else{
            ffmpeg_compression = ffmpeg.exe -i `"%com_in_path%`" %com_complex_filter% %com_cut_full% -c:v %com_encoder_full% %com_enc_rate% %com_framerate% %com_audio_codec% -y `"%com_out_path%.%com_ext%`"
            
            if (ffmpeg_showcmd){
                Clipboard := ffmpeg_compression
                MsgBox,, Simple Studio, %ffmpeg_compression%
                ExitApp
                Return
            }
            
            Run %ComSpec% /c `"%ffmpeg_compression%`",,, com_PID
            WinWait, ahk_pid %com_PID%
            WinWaitClose
        }

        Run %COMSPEC% /c explorer.exe /select`, `"%com_out_path%.%com_ext%`",, Hide
        Run, %A_ScriptFullPath%
    }
Return

; ========================

ConcatenationInputFiles:
    FileDelete, concatenation_list.txt
    concat_in_file_list := ""
    FileSelectFile, concat_in_path, M,, Simple Studio - Input files, Videos (*.mp4; *.mkv; *.mov)
    concat_in_array := StrSplit(concat_in_path, "`n")
    concat_array_len := concat_in_array.Length() - 1
    Loop %concat_array_len%{
        FileAppend, % "file '" . concat_in_array[1] . "\" . concat_in_array[A_Index + 1] . "'`n", concatenation_list.txt
        concat_in_file_list := concat_in_file_list . "[" . A_Index . "] : " . concat_in_array[1] . "\" . concat_in_array[A_Index + 1] . "'`n`n"
    }
    GuiControl,, concat_in_path, %concat_in_file_list%
Return

ConcatenationOutputFile:
    FormatTime, output_filename,, ddMMMyyyy [HH.mm.ss]
    FileSelectFile, concat_out_path, S,%output_filename%, Simple Studio - Output file path, Videos (*.mp4; *.mkv; *.mov)
    GuiControl,, concat_out_path, %concat_out_path%
Return

ConcatenationSubmit:
    GuiControlGet, concat_in_path
    GuiControlGet, concat_out_path
    if (concat_in_path == "" or concat_out_path == ""){
        MsgBox,, Simple Studio, Wrong Input or Output File Path!
        Return
    }
    MsgBox, 4, Simple Studio, Do you want to start the concatenation?
    IfMsgBox, Yes
        concat_ans = 1
    if (concat_ans){
        Gui, Submit, NoHide
        ffmpeg_concatenation = ffmpeg.exe -f concat -safe 0 -i concatenation_list.txt -c copy `"%concat_out_path%.%concat_ext%`"
        
        if (ffmpeg_showcmd){
            Clipboard := ffmpeg_concatenation
            MsgBox,, Simple Studio, %ffmpeg_concatenation%
            ExitApp
            Return
        }
        
        Run %ComSpec% /c `"%ffmpeg_concatenation%`",,, concat_PID
        WinWait, ahk_pid %concat_PID%
        WinWaitClose
        FileDelete, concatenation_list.txt
        Run %COMSPEC% /c explorer.exe /select`, `"%concat_out_path%.%concat_ext%`",, Hide
        Run, %A_ScriptFullPath%
    }
Return

OnExit, GuiClose
GuiClose:
    if (recording)
        Gosub, StopRecording
    ExitApp
