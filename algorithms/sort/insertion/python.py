import random as rnd;


def insertion_sort(a):
    for j in range(1, len(a)):
        insert_element(a[j], a, j - 1)
        print(a)


# Вставить элемент e в массив a с учётом того что элементы a от 0 до i упорядочены
def insert_element(e, a, i):
    while(i >= 0 and a[i] > e):
        a[i + 1] = a[i]
        i -= 1

    a[i + 1] = e


def create_random_array(n):
    a = [None] * n
    for i in range(0, n):
        a[i] = rnd.randint(0, n * n)
    return a


if __name__ == '__main__':
    array = [5,2,4,6,1,3]
    print(array)
    insertion_sort(array)
    print(array)
