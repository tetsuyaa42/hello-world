import numpy as np

def trocaValores(array):
  for i in np.nditer(a, op_flags=['readwrite']):
    if(i>0):
      i[...]=1
    if(i<0):
      i[...]=-1

a = np.arange(-5,6,1)
trocaValores(a)
print(a)

def menorAbsCol(matrix):
  b = np.argmin(np.abs(mm),axis=0)
  return mm[b, np.array([0,1,2,3])]

mm = np.array(([[-5, -4, -3,  1],
                [-1,  0, 10,  2],
                [ 3,  4,  5,  0]]))
                
menores = menorAbsCol(mm)
print(menores)

