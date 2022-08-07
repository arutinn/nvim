" Enable Mouse
set mouse=a
set title

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
  GuiScrollBar 1
endif

call rpcnotify(0, 'Gui', 'WindowMaximized', 1)
