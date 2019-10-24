a = [0,1,2,3,4,5,6,7,8,9]

#criar uma lista com apenas os valores pares de outra lista
b = []
for i in range(0, len(a)):
  if (a[i] % 2) == 0:
    b.append(a[i])
print(b)

#criar uma lista com os valores nas posicoes pares
c = []
for i in range(0, len(a)):
  if((i) % 2) == 0:
    c.append(a[i])
print(c)

#criar um dicionario com a contagem de cada elemento numa lista
aa = [1,2,3,4,3,2,4,3,4,3,2,1,2,1,2,3,4,1,6,2,2,2,2,2]
dic = {}
for i in range(0, len(aa)):
  if(aa[i] not in dic):
    dic[aa[i]] = 1
  else:
    dic[aa[i]] = dic[aa[i]] + 1
print(dic)

#qual é a chave associada ao maior valor num dicionario
dicc = {"a": 1, "b": 45, "c": 89, "d": 5, "e": 8}
aux = 0
for key in dicc:
  if(dicc[key] > aux):
    aux = dicc[key]
    auxKey = key
print("Chave com maior elemento: " + auxKey)

#qual o elemento mais comum numa lista
aaa = [1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,4,4,4,44,4,5,55,5,5,55,5,55,5,5]
diccc = {}
aux2 = 0
for i in range(0, len(aaa)):
  if(aaa[i] not in dic):
    diccc[aaa[i]] = 1
  else:
    diccc[aaa[i]] = dic[aaa[i]] + 1
for key in diccc:
  if(diccc[key] > aux2):
    aux2 = diccc[key]
    auxKey2 = key
print(auxKey2)

#uma lista é sublista de outra?


#dado 2 strings o fim de um é igual ao comeco do outro?