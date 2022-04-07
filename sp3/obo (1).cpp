#include <cstdio>
#include <cstdint>
#include <cstddef>

extern "C"
{
char foo(char *arr1, char *arr2, size_t size);
}


int main(void) {

    char arr1[] = "abcd231a";
    char arr2[sizeof(arr1)];

    size_t size = sizeof(arr1) ;

    foo(arr1, arr2, size);
    arr2[size] = '\0';
    printf("%s\n",arr2);
	printf("%d\n", sizeof(arr1)/sizeof(char));
    return 0;
}
