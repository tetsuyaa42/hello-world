def is_palindromo(str1, str2):
  b = str1.replace(" ","")
  c = b[::-1]
  d = str2.replace(" ","")
  if(d==c):
    print(True)
  else:
    print(False)

is_palindromo("a va", "av a")