function wipedns
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder
end
