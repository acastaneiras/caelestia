function winapps --wraps='xfreerdp3 /u:MyWindowsUser /p:MyWindowsPassword /v:127.0.0.1:3389 /cert:tofu' --description 'alias winapps=xfreerdp3 /u:MyWindowsUser /p:MyWindowsPassword /v:127.0.0.1:3389 /cert:tofu'
    xfreerdp3 /u:MyWindowsUser /p:MyWindowsPassword /v:127.0.0.1:3389 /cert:tofu $argv
end
