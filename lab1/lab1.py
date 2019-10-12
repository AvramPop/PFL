class Nod:
    def __init__(self, e):
        self.e = e
        self.urm = None

class Lista:
    def __init__(self):
        self.prim = None


'''
crearea unei liste din valori citite pana la 0
'''
def creareLista():
    lista = Lista()
    lista.prim = creareLista_rec()
    return lista

def getValue(lista):
    return lista.prim.e

def creareLista_rec():
    x = int(input("x="))
    if x == 0:
        return None
    else:
        nod = Nod(x)
        nod.urm = creareLista_rec()
        return nod

'''
tiparirea elementelor unei liste
'''
def tipar(lista):
    tipar_rec(lista.prim)

def tipar_rec(nod):
    if nod != None:
        print (nod.e)
        tipar_rec(nod.urm)

def getHead(list):
    return getValue(list)

def isVoid(list):
    return list.prim == None

def listWithoutFirstElement(list):
    newList = Lista()
    newList.prim = list.prim.urm
    return newList

def elementInListRecursive(element, list):
    if isVoid(list):
        return False
    else:
        if element == getHead(list):
            return True
        else:
            return elementInListRecursive(element, listWithoutFirstElement(list))

def elementInList(element, list):
    if isVoid(list):
        return False
    else:
        return elementInListRecursive(element, list)

def isSet(list):
    if isVoid(list):
        return True
    else:
        if elementInList(getHead(list), listWithoutFirstElement(list)):
            return False
        else:
            return isSet(listWithoutFirstElement(list))

def numberOfDistinctElements(list):
    if isVoid(list):
        return 0
    else:
        if elementInList(getHead(list), listWithoutFirstElement(list)):
            return numberOfDistinctElements(listWithoutFirstElement(list))
        else:
            return 1 + numberOfDistinctElements(listWithoutFirstElement(list))

'''
program pentru test
'''

def main():
    list = creareLista()
    #tipar(list)
    print(isSet(list))
    print(numberOfDistinctElements(list))
main()

'''
3. a. Check if a list is a set.
b. Determine the number of distinct elements from a list
'''


'''


    '''
