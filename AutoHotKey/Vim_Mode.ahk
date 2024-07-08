q & a::send,"qa"
q & b::send,"qb"
q & c::send,"qc"
q & d::send,"qd"
q & e::send,"qe"
q & f::send,"qf"
q & g::send,"qg"
q & i::send,"qi"
q & o::send,"qo"
q & p::send,"qp"
q & r::send,"qr"
q & s::send,"qs"
q & t::send,"qt"
q & u::send,"qu"
q & v::send,"qv"
q & w::send,"qw"
q & x::send,"qx"
q & y::send,"qy"
q & z::send,"qz"
return
q & j::
send, {Down}
Return
q & k::
send, {Up}
Return
q & h::
send, {Left}
Return
q & l::
send, {Right}
Return

q & n::
send, {Home}
Return
q & m::
send, {end}
Return
q & 5::
    run, C:\Windows\System32\cmd.exe
Return
q & 9::
run, https://www.google.com/
Return
q & 0::
run, https://chatgpt.com/
Return
!n:: send +{home}
return
!m:: send +{end}
return

$q::
send,% GetKeyState("CapsLock", "T")?"Q":"q"
return
$+q:: send,% GetKeyState("CapsLock","T")?"q":"Q"
Return
