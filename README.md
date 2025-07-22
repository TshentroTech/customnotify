

**Replace the above code with the following:**

```
function QBCore.Functions.Notify(text, texttype, length)
    exports['customnotify']:notify(text, texttype, length);
end
```

## usage:
```
QBCore.Functions.Notify("messagge here", 'success', 5000) 
```

error
success
primary 
warning
info