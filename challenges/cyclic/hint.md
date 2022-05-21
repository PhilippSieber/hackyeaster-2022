```
flag = [ ... ]

main = do
     putStrLn "[λ] I will now print your flag. Please be patient"
     mapM_ putFlush $ map convert flag
```