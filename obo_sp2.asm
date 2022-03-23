global _start

section .data
arr1 db 01100100b, 11111111b, 11111010b, 11110000b, 00000001b, 00000101b, 00000110b, 00000111b, 00001001b, 00001010b

section .bss ; не инициалированные данные
arr2 resb 10 ; резервирование количества слов(байт)

section .text
_start:
    mov ecx, 10 ; регистр общего назначения
    mov esi, arr1 ; индекс источника (так же регистр общего назначения)
    mov edi, arr2 ; индекс приемника (так же регистр общего назначения)
    xor eax, eax    ; Обнуляем eax
lp1:
    lodsb ; загружает в еax байт, из ячейки памяти указанной в индексе источника
    bt eax, 7 ; смотрим на значение (старшего) записывает значение бита в CF
    jae lp ; если 0, то переходим к lp смотрит на CF
    not al ; меняет значения бит в регистре ah на противоположны
    stosb ; сохраняет байт по адресу в edi
    loop lp1 ; в качестве счетчика используется ecx
lp:
    stosb
    loop lp1

    mov ecx, 10
    mov esi, arr2
    xor ebx, ebx    ; Обнуляем ebx
lp2:
    lodsb
    add ebx, eax    ; Добавляем число к сумме
    loop lp2
end:
    mov eax, 1
    mov ebx, 0
    int 0x80 ; прерывание для выполнения кода в ядре