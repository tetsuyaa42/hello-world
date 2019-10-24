import time

def temp_exec(f):
	def wrapper(*args): 
		start_time = time.time()
		x = f(*args)
		print("--- %s seconds ---" % (time.time() - start_time))
		return x
	return wrapper

class memoiza:
	def _init_(self,f):
		self.f=f
		self.dic={}
	def _call_(self,*args):
		entrada = args
		if entrada in self.dic:
			return self.dic[entrada]
		else:
			res = self.f(*args)
			self.dic[entrada] = res
			print(self.dic)
			return res

def aux(x):
	acc = 0
	for n in range(0,x):
		acc = n
	return acc


def fib(n):
	if n==0 or n==1:
		return 1
	else:
		return fib(n-1) + fib(n-2)

zz = temp_exec(aux)
memo = memoiza(fib)
print(zz(2**10))
for i in range(0,20):
	print(memo(i))