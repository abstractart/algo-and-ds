def selection_sort(a):
    n = len(a)
    for i in range(0, n - 1):
        swap(a, maximum(a, i, n), i)


def minimum(a, begin, end):
    index = begin
    for i in range(begin, end):
        if a[i] < a[index]:
            index = i

    return index

def swap(a, i, j):
    tmp = a[i]
    a[i] = a[j]
    a[j] = tmp

def maximum(a, begin, end):
    index = begin
    for i in range(begin, end):
        if a[i] > a[index]:
            index = i

    return index

if __name__ == '__main__':
    array = [5,2,4,6,1,3]
    print(array)
    selection_sort(array)
    print(array)
