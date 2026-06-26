---@module 'hl'

-- Variables
local cursorTheme = "Bibata-Modern-Classic"

-- Env vars
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("MOZ_WEBRENDER", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")
