import random as rnd;


def insertion_sort(a):
    for j in range(1, len(a)):
        insert_element(a[j], a, j - 1)


# Вставить элемент e в массив a с учётом того что элементы a от 0 до i упорядочены
def insert_element(e, a, i):
    index = find_index(e, a, i)

    shift(a, index, i)
    a[index] = e


def find_index(e, a, i):
    j = 0
    while a[j] < e:
        j += 1

    return j


# Сдвинуть вправо
def shift(a, begin, end):
    for j in range(end + 1, begin, -1):
        a[j] = a[j - 1]


def create_random_array(n):
    a = [None] * n
    for i in range(0, n):
        a[i] = rnd.randint(0, n * n)
    return a


if __name__ == '__main__':
    array = create_random_array(20)
    print(array)
    insertion_sort(array)
    print(array)
