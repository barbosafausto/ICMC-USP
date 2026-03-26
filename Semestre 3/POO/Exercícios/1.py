from datetime import date

class Pessoa:

    def __init__(self, nome: str, data_nasc: int, peso: float, altura: int):
            self.nome = nome
            self.data_nasc = data_nasc
            self.peso = peso
            self.altura = altura
    
    def get_nome(self):
        return self.nome

    def get_data_nasc(self):
        return self.data_nasc
    
    def get_peso(self):
        return self.peso
    
    def get_altura(self):
        return self.altura
    

    def set_nome(self, nome):
        self.nome = nome
    
    def set_data_nasc(self, data_nasc):
        self.data_nasc = data_nasc
    
    def set_peso(self, peso):
        self.peso = peso
    
    def set_altura(self, altura):
        self.altura = altura

    
    def calcula_idade(self):
        return date.today().year - self.data_nasc


Eu = Pessoa("Fausto", 2004, 90, 183)
print(f"Meu nome é {Eu.get_nome()} e eu estou aprendendo POO com {Eu.calcula_idade()} anos")



class Agenda:

    # Estático
    max_pessoas = 100
    
    def __init__(self):
        self.num_pessoas = 0
        self.pessoas = []


    def armazenar_pessoa(self, Pessoa):
        
        if (self.num_pessoas < self.max_pessoas):
            self.num_pessoas += 1
            self.pessoas.append(Pessoa)
        
        else:
            print("Erro: capacidade máxima da agenda atingida.\n")
    
    def remover_pessoa(self, Pessoa):

        if (self.num_pessoas > 0):
            self.num_pessoas -= 1
            self.pessoas.remove(Pessoa)
        
        else:
            return "Erro: não há pessoas na agenda.\n"
    

    def acha_pelo_nome(self, pessoa: str):

        for p in self.pessoas:
            if (pessoa == p.get_nome()):
                return f"{p.get_nome()} está na agenda.\n"
        
        return f"{pessoa} não está na agenda.\n"

    
    def acha_pela_posição(self, pos: int):

        if (pos < self.num_pessoas):
            return f"{self.pessoas[pos].get_nome()}"

        else:
            return f"Não existe a pessoa número {pos}.\n"


agenda = Agenda()
agenda.armazenar_pessoa(Eu)
print(f"{agenda.acha_pelo_nome(Eu)}")

Outro = Pessoa("Gleyce", 2003, 55, 150)
print(f"{agenda.acha_pelo_nome(Outro.get_nome())}")

agenda.armazenar_pessoa(Outro)
print(f"{agenda.acha_pelo_nome(Outro.get_nome())}")



