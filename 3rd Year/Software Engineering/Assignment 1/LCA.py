class Node:
    def __init__(self, key, parent):
        self.key = key
        self.parent = parent
        if parent is None:
            self.tier = 0;
        else:
            self.tier = parent.tier+1

a = Node('a', None)
b = Node('b', a)
c = Node('c', a)
d = Node('d', b)
e = Node('e', b)
f = Node('f', e)
g = Node('g', e)
h = Node('h', c)

def getLCA(one, two):
    if one.parent!=None and two.parent!=None:
        if one.parent.key==two.parent.key:
            return one.parent.key
        elif one.tier < two.tier:
            return getLCA(one, two.parent)
        else:
            return getLCA(two, one.parent)
    return 'none'

print('Should be b - ' + getLCA(d,f))
print('Should be e - ' + getLCA(f,g))
print('Should be a - ' + getLCA(g,c))
print('Should be a - ' + getLCA(d,h))
print('Should be none - ' + getLCA(a,b))