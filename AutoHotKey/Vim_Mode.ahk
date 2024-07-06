d & a::send,"da"
d & b::send,"db"
d & c::send,"dc"
d & e::send,"de"
d & f::send,"df"
d & g::send,"dg"
d & i::send,"di"
d & o::send,"do"
d & p::send,"dp"
d & q::send,"dq"
d & r::send,"dr"
d & s::send,"ds"
d & t::send,"dt"
d & u::send,"du"
d & v::send,"dv"
d & w::send,"dw"
d & x::send,"dx"
d & y::send,"dy"
d & z::send,"dz"
return
d & j::
send, {Down}
Return
d & k::
send, {Up}
Return
d & h::
send, {Left}
Return
d & l::
send, {Right}
Return

d & n::
send, {Home}
Return
d & m::
send, {end}
Return
d & 5::
    run, C:\Windows\System32\cmd.exe
Return
d & 9::
run, http://www.google.com/
Return
d & 0::
run, https://chatgpt.com/
Return
!n:: send +{home}
return
!m:: send +{end}
return

$d::
send,% GetKeyState("CapsLock", "T")?"D":"d"
return
$+d:: send,% GetKeyState("CapsLock","T")?"d":"D"
Return
