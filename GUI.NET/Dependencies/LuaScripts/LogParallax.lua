﻿-----------------------
-- Name: Log Parallax
-- Author: spiiin
-----------------------
-- Draws a red line over each scanline that CPU writes to $2005 or $2006 occurred
-----------------------

PPUSCROLL = 0x2005;
colorCode = 0x4000FF00;

function onScroll(address, value)
  local state = emu.getState();
  emu.log("Scrolling change. Scanline: "..state.ppu.scanline.." Value:"..value);
  local color = colorCode + state.ppu.scanline;
  emu.drawLine(0, state.ppu.scanline, 256, state.ppu.scanline, color, 1)
end;

emu.addMemoryCallback(onScroll, emu.memCallbackType.cpuWrite, PPUSCROLL, PPUSCROLL+1);
emu.displayMessage("Script", "Log Parallax")