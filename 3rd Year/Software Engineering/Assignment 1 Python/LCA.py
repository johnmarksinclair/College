class Node:
    def __init__(self, key, parent):
        self.key = key
        self.parent = parent
        if parent is None:
            self.tier = 0;
        else:
            self.tier = parent.tier+1

def getLCA(one, two):
    if one.parent!=None and two.parent!=None:
        if one.parent.key==two.parent.key:
            return one.parent.key
        elif one.tier < two.tier:
            return getLCA(one, two.parent)
        else:
            return getLCA(two, one.parent)
    return 'none'