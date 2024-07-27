` & a::send, "`a"
` & b::send, "`b"
` & c::send, "`c"
` & d::send, "`d"
` & e::send, "`e"
` & f::send, "`f"
` & g::send, "`g"
` & i::send, "`i"
` & o::send, "`o"
` & p::send, "`p"
` & r::send, "`r"
` & s::send, "`s"
` & t::send, "`t"
` & u::send, "`u"
` & v::send, "`v"
` & w::send, "`w"
` & x::send, "`x"
` & y::send, "`y"
` & z::send, "`z"
return

` & j::
send, {Down}
Return

` & k::
send, {Up}
Return

` & h::
send, {Left}
Return

` & l::
send, {Right}
Return

` & n::
send, {Home}
Return

` & m::
send, {End}
Return

` & 5::
run, C:\Windows\System32\cmd.exe
Return

` & 9::
run, https://www.google.com/
Return

` & 0::
run, https://chatgpt.com/
Return

!n::send +{Home}
Return

!m::send +{End}
Return

$`::send,% GetKeyState("CapsLock", "T")? "``" : "``"
Return
$+`::send, % GetKeyState("CapsLock", "T") ? "``" : "~"
Return