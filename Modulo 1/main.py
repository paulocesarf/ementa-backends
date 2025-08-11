import time
import heapq
import os
from collections import OrderedDict
import difflib

# ---------------------------
# 1. CACHE LRU + TTL
# ---------------------------

class LRUCache:
    def __init__(self, capacidade):
        self.cache = OrderedDict()
        self.capacidade = capacidade

    def get(self, chave):
        if chave in self.cache:
            valor, timestamp, ttl = self.cache.pop(chave)
            if ttl is not None and time.time() - timestamp > ttl:
                return None  # expirado
            self.cache[chave] = (valor, time.time(), ttl)
            return valor
        return None

    def set(self, chave, valor, ttl=None):
        if chave in self.cache:
            self.cache.pop(chave)
        elif len(self.cache) >= self.capacidade:
            self.cache.popitem(last=False)
        self.cache[chave] = (valor, time.time(), ttl)

    def exibir_cache(self):
        os.system('cls' if os.name == 'nt' else 'clear')
        print("Cache Atual:")
        agora = time.time()
        for k, (v, t, ttl) in self.cache.items():
            if ttl is not None:
                expirado = (agora - t > ttl)
                restante = max(0, int(ttl - (agora - t)))
                status = "EXPIRADO" if expirado else f"expira em {restante}s"
            else:
                status = "sem expiração"
            print(f"{k} => {v} ({status})")

# ---------------------------
# 2. BUSCA BINÁRIA
# ---------------------------

def busca_binaria(lista, alvo, verbose=True):
    inicio = 0
    fim = len(lista) - 1
    tentativas = 0

    while inicio <= fim:
        tentativas += 1
        meio = (inicio + fim) // 2
        if verbose:
            print(f"Tentativa {tentativas}: comparando com índice {meio} (valor: {lista[meio]})")
        if lista[meio] == alvo:
            return meio
        elif lista[meio] < alvo:
            inicio = meio + 1
        else:
            fim = meio - 1

    return -1  # não encontrado


import hashlib

# ---------------------------
# 3. GERENCIADOR DE SESSÕES
# ---------------------------
class GerenciadorSessoes:
    def __init__(self):
        self.sessoes = {}
        self.usuarios = {}

    def criar_hash(self, senha):
        return hashlib.sha256(senha.encode()).hexdigest()

    def cadastrar(self, usuario, senha):
        if usuario in self.usuarios:
            print(f"Usuário '{usuario}' já existe.")
            return
        senha_hash = self.criar_hash(senha)
        self.usuarios[usuario] = senha_hash
        print(f"Usuário '{usuario}' cadastrado com sucesso.")
        print(f"Senha transformada em hash: {senha_hash}")

    def login(self, usuario, senha, ttl=300):
        if usuario not in self.usuarios:
            print("Usuário não cadastrado.")
            return
        senha_hash = self.criar_hash(senha)
        print("Transformando senha em hash...")
        print(f"(hash) {senha_hash}")
        if self.usuarios[usuario] != senha_hash:
            print("Senha incorreta.")
            return
        timestamp = time.time()
        self.sessoes[usuario] = {'hash': senha_hash, 'timestamp': timestamp, 'ttl': ttl}
        print(f"Usuário '{usuario}' autenticado com sucesso.")

    def validar_sessao(self, usuario, senha):
        if usuario not in self.sessoes:
            return False
        sessao = self.sessoes[usuario]
        senha_hash = self.criar_hash(senha)
        print(f"Hash fornecido : {senha_hash}")
        print(f"Hash esperado  : {sessao['hash']}")
        if senha_hash != sessao['hash']:
            return False
        if time.time() - sessao['timestamp'] > sessao['ttl']:
            print("Sessão expirada.")
            del self.sessoes[usuario]
            return False
        return True

    def listar_usuarios_ativos(self):
            ativos = []
            agora = time.time()
            for usuario, sessao in self.sessoes.items():
                tempo_restante = max(0, int(sessao['ttl'] - (agora - sessao['timestamp'])))
                if tempo_restante > 0:
                    ativos.append((usuario, sessao['hash'], tempo_restante))
            return ativos

        
    def listar_usuarios_cadastrados(self):
        print("Usuários cadastrados:")
        if not self.usuarios:
            print("Nenhum usuário cadastrado.")
        for usuario, senha_hash in self.usuarios.items():
            print(f"- {usuario} | hash: {senha_hash}")

    def logout(self, usuario):
        if usuario in self.sessoes:
            del self.sessoes[usuario]
            print(f"Usuário '{usuario}' desconectado.")



# ---------------------------
# 4. RANKING COM HEAP
# ---------------------------
class Ranking:
    def __init__(self):
        self.heap = []

    def adicionar_score(self, usuario, score):
        heapq.heappush(self.heap, (-score, usuario))

    def top_n(self, n):
        return sorted(self.heap, reverse=False)[:n]  # do maior para o menor


    def mostrar_ranking(self, n=5):
        print("Top", n)
        for score, usuario in self.top_n(n):
            print(f"{usuario}: {-score}")

# ---------------------------
# LISTA DE TESTE COM 100 ELEMENTOS
# ---------------------------
lista_100 = list(range(0, 200, 2))  # Lista com 100 elementos pares de 0 a 198

# ---------------------------
# MENU PRINCIPAL
# ---------------------------
def menu():
    print("\n=== MENU PRINCIPAL ===")
    print("1 - Cache LRU com TTL")
    print("2 - Busca Binária")
    print("3 - Gerenciador de Sessões")
    print("4 - Ranking Dinâmico")
    print("0 - Sair")
    return input("Escolha uma opção: ")

def executar():
    cache = LRUCache(capacidade=3)
    sessoes = GerenciadorSessoes()
    ranking = Ranking()
    os.system('cls' if os.name == 'nt' else 'clear')
    while True:
        opcao = menu()

        if opcao == "1":
            print("\n--- Teste Interativo do Cache LRU + TTL ---")
            while True:
                print("\n1 - Adicionar/Atualizar item")
                print("2 - Buscar item")
                print("3 - Exibir Cache")
                print("0 - Voltar ao Menu Principal")
                escolha = input("Escolha: ")

                if escolha == "1":
                    chave = input("Chave: ")
                    valor = input("Valor: ")
                    usar_ttl = input("Deseja definir tempo de expiração? (s/n): ").strip().lower()
                    if usar_ttl == 's':
                        try:
                            ttl = int(input("Tempo de expiração em segundos: "))
                        except ValueError:
                            print("Valor inválido. Usando sem expiração.")
                            ttl = None
                    else:
                        ttl = None
                    cache.set(chave, valor, ttl)
                    print(f"Item '{chave}' definido.")

                elif escolha == "2":
                    chave = input("Chave para buscar: ")
                    resultado = cache.get(chave)
                    if resultado is None:
                        print(f"'{chave}' não encontrado (pode ter expirado ou não existir).")
                    else:
                        print(f"Valor de '{chave}': {resultado}")

                elif escolha == "3":
                    cache.exibir_cache()

                
                elif escolha == "4":
                    ativos = sessoes.listar_usuarios_ativos()
                    if ativos:
                        print("Usuários ativos:")
                        for usuario, h, tempo in ativos:
                            print(f"- {usuario} | hash: {h} | expira em: {tempo}s")
                    else:
                        print("Nenhum usuário com sessão ativa.")

                elif escolha == "5":
                    sessoes.listar_usuarios_cadastrados()

                elif escolha == "0":
                    break

                else:
                    print("Opção inválida.")

        elif opcao == "2":
            os.system('cls' if os.name == 'nt' else 'clear')
            print("--- Teste Busca Binária com Sugestão de Semelhantes ---")
            nomes = ['Adriana Rocha', 'Adriana Martins', 'Breno Fonseca', 'Bruno César', 'Caio Moreira', 'Carlos Eduardo', 'Daniela Lima', 'Diego Monteiro', 'Eduarda Martins', 'Elaine Ventura', 'Felipe Souza', 'Fernanda Luz', 'Gabriela Rocha', 'Giovana Mendes', 'Heitor Carvalho', 'Henrique Dias', 'Igor Farias', 'Isabela Ferreira', 'João Pedro', 'Jéssica Barros', 'Karina Borges', 'Kauan Neves', 'Letícia Prado', 'Lucas Silva', 'Manoel Brito', 'Mariana Costa', 'Natália Cunha', 'Nicolas Almeida', 'Olívia Peixoto', 'Otávio Ramos', 'Patrícia Moraes', 'Paulo Henrique', 'Queila Martins', 'Quésia Duarte', 'Rafael Cardoso', 'Ricardo Melo', 'Sabrina Oliveira', 'Samara Luz', 'Tatiane Vilela', 'Thiago Nunes', 'Uelton Dias', 'Ursula Pinheiro', 'Valéria Campos', 'Vanessa Ribeiro', 'Wesley Gomes', 'William Castro', 'Xavier Machado', 'Yasmin Lopes', 'Yuri Andrade', 'Zilda Teixeira']
            nomes.sort()
            print("Lista de nomes ordenada:")
            for i, nome in enumerate(nomes):
                print(f"{i}. {nome}")

            alvo = input("Digite o nome exato para buscar: ").strip()
            pos = busca_binaria(nomes, alvo)

            if pos != -1:
                print(f"Nome encontrado na posição {pos}: {nomes[pos]}")
            else:
                print("Nome não encontrado.")
                sugestoes = difflib.get_close_matches(alvo, nomes, n=5, cutoff=0.6)
                for sugestao in sugestoes:
                    escolha = input(f"Você quis dizer '{sugestao}'? (s/n): ").strip().lower()
                    if escolha == 's':
                        pos = busca_binaria(nomes, sugestao)
                        if pos != -1:
                            print(f"Nome encontrado na posição {pos}: {nomes[pos]}")
                        else:
                            print("Nome ainda não encontrado mesmo após sugestão.")
                        break
                else:
                    print("Nenhuma sugestão aceita.")


        elif opcao == "3":
            print("\n--- Gerenciador de Sessões ---")
            while True:
                print("\n1 - Cadastrar")
                print("2 - Login")
                print("2 - Validar Sessão")
                print("3 - Logout")
                print("4 - Listar Usuários Ativos")
                print("5 - Listar Usuários Cadastrados")

                print("0 - Voltar")
                escolha = input("Escolha: ")

                if escolha == "1":
                    usuario = input("Novo usuário: ")
                    senha = input("Nova senha: ")
                    sessoes.cadastrar(usuario, senha)

                elif escolha == "2":
                    usuario = input("Usuário: ")
                    senha = input("Senha: ")
                    ttl = int(input("Tempo de expiração (segundos): "))
                    sessoes.login(usuario, senha, ttl)

                elif escolha == "2":
                    usuario = input("Usuário: ")
                    senha = input("Senha: ")
                    if sessoes.validar_sessao(usuario, senha):
                        print("Sessão válida.")
                    else:
                        print("Sessão inválida ou expirada.")

                elif escolha == "3":
                    usuario = input("Usuário: ")
                    sessoes.logout(usuario)

                
                elif escolha == "4":
                    ativos = sessoes.listar_usuarios_ativos()
                    if ativos:
                        print("Usuários ativos:")
                        for usuario, h, tempo in ativos:
                            print(f"- {usuario} | hash: {h} | expira em: {tempo}s")
                    else:
                        print("Nenhum usuário com sessão ativa.")

                elif escolha == "5":
                    sessoes.listar_usuarios_cadastrados()

                elif escolha == "0":
                    break

                else:
                    print("Opção inválida.")


        elif opcao == "4":
            print("\n--- Teste Ranking ---")
            nome = input("Nome do usuário: ")
            score = int(input("Score: "))
            ranking.adicionar_score(nome, score)
            ranking.mostrar_ranking()

        elif opcao == "0":
            print("Saindo...")
            break

        else:
            print("Opção inválida.")

if __name__ == "__main__":
    executar()
