class descontinuada:
  def __init__(self, f, nome1, nome2):
    self.f = f
    self.count = 0
    self.nome1 = nome1
    self.nome2 = nome2

  def __call__(self, *args):
    if(self.count == 0):
      print('a funcao ',self.nome1,'sera descontinuada na proxima edicao da biblioteca\n use a funcao ',self.nome2,' na proxima versão')
      self.count += 1
    res = self.f(*args)
    return res

teste = descontinuada(soma, 'soma', 'add')
teste(1,3)
teste(4,5)
