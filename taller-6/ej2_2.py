from cache import *

# Inicializo memoria de 2^16 posiciones
memoria = [0x0000 for i in range(2**16)]

# Creo la cache
caches = {
    "fifo" : CacheTotalmenteAsociativa(
        memory=memoria,
        cacheSize=64, 
        nLines=4,
        cacheAlg=FIFO,
    ),
    "random": CacheTotalmenteAsociativa(
        memory=memoria,
        cacheSize=64, 
        nLines=4,
        cacheAlg=RANDOM,
    ),
    "lru": CacheTotalmenteAsociativa(
        memory=memoria,
        cacheSize=64, 
        nLines=4,
        cacheAlg=LRU,
    )
}

benchmark = "benchmark_matrix_iguales.list"
print("benchmark: {0}".format(benchmark))
for type, cache in caches.items():
    print("fetching {0}".format(type))
    cache.fetchFrom(benchmark)
    print("hit rate: {0}".format(cache.hitRate()))

