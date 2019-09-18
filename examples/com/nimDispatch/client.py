import win32com.client

obj = win32com.client.GetObject("nimDispatch")
obj._FlagAsMethod("setString")
obj._FlagAsMethod("getString")
obj._FlagAsMethod("exit")

print(obj.getString())
obj.setString("new string is hello world")
print(obj.getString())
obj.exit()
