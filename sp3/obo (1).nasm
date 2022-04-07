global foo

section .text
; DWORD foo(DWORD dst, DWORD src, DWORD n)
foo:
    add eax, 0
	;std устанавливает флаг df в 1
    push ebp
    mov ebp, esp ; ebp - указатель базы
    
    sub esp, 4 ; объявляем локальную переменную
    mov eax, DWORD [ebp+16]; записываем размер массива
    ;mul записывает в eax 4*размер массива
    add eax, -2

    mov edi, [ebp+12]  ; адрес первого(второго) массива
    mov esi, [ebp+8] ; адрес второго(первого) массива
    add esi, eax; записываем в esi ссылку на предпоследний элемент массива
    mov ecx, [ebp+16] ; количество элементов

    mov DWORD [ebp-4], 0
lp:
    mov eax, [esi]
    mov BYTE [edi], al
	;add DWORD [ebp-4], eax  сохраняем результат в локальной переменной
	;stosd  как-то нужно установить флаг df=1 чтобы онуменьшал значение
    add edi, 1 ; переходим к следующему элементу в первом массиве
    add esi, -1 ; переходим к следующему элементу во втором массиве
    jmp lp2
    loop lp

lp2:
    loop lp

    ;mov eax, DWORD [ebp-4]  сохраняем результат из локальной переменной
    add esp, 4 ; удаляем локальную переменную

    mov esp, ebp
    pop ebp
    ret
