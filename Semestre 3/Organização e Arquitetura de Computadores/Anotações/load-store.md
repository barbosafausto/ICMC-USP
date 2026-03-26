# Load & Store

```
load AC <- mem
store mem <- AC
```

## Load



`lb` - carrega 1 **byte** da memória para um registrador

`lw` - carrega 1 **palavra** da memória para um registrador

## Store

`sb` - armazena 1 **byte** da memória para um registrador

`sw` - armazena 1 **palavra* da memória para um registrador


```mips
l <reg>, offset(<reg_base>) => <reg> = mem(<reg_base> + offset)

lw t0, 0(s0) => t0 = mem(s0 + 0)

s <reg>, offset(<reg_base>) => mem(<reg_base> + offset) = <reg>
sw ra, 4(sp) => mem(sp + 4) = ra
```


### Exemplo

```mips
--  a0 guarda o valor 12
-- Abaixo: 20 + 12 = 32 (endereço), 20 é offset
-- t0 guardará o conteúdo do endereço 32
lw t0, 20(a0)   


-- s0 guarda 16
-- Abaixo: 0 + 16 = 16
-- O conteúdo de a0 será escrito na posição 16
sw a0, 0(s0)  
```



