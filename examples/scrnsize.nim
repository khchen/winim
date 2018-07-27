import winim.lean
import strformat

var
  cxScreen = GetSystemMetrics(SM_CXSCREEN)
  cyScreen = GetSystemMetrics(SM_CYSCREEN)
  msg = fmt"The screen is {cxScreen} pixels wide by {cyScreen} pixels high."

MessageBox(0, msg, "Screen Size", 0)
