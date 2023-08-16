import winim/mean

AttachConsole(-1) # fix stdout not working in already opened cmd when compiling as a gui app
discard stdout.reopen("CONOUT$", fmWrite)

echo "hello in cmd from gui app"
