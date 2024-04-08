import pgf
import sys
import csv

def checkExpr(g,e):

    all_types = [pgf.readType(c) for c in g.categories]
    found = False
    for t in all_types:
        try:
            g.checkExpr(e,t)
            found = True
            break
        except pgf.PGFError:
            continue
        except pgf.TypeError:
            continue
    
    return found

if __name__ == '__main__':

    import argparse

    parser = argparse.ArgumentParser(description='Generate multilingual treebank from list of trees')

    parser.add_argument('trees',help='file with line separated trees')
    parser.add_argument('pgf',help='grammar for generating linearisations')
    parser.add_argument('treebank',help='filename for writing csv treebank')
    parser.add_argument('-l',dest='lang_codes',nargs='*',help='codes of languages to include (default all)')

    args = parser.parse_args()

    with open(args.trees) as f:
        tree_strs = [l.strip() for l in f.readlines()]

    g = pgf.readPGF(args.pgf)
    if args.lang_codes:
        lang_codes_lower = [l.lower() for l in args.lang_codes]
        concretes = [g.languages[l] for l in g.languages if l[-3:].lower() in lang_codes_lower]
    else:
        concretes = [g.languages[l] for l in g.languages]
        lang_codes_lower = [l[-3:].lower() for l in g.languages]

    rows = [['tree']+lang_codes_lower]
    for t in tree_strs:
        e = pgf.readExpr(t)
        if not checkExpr(g,e):
            print(f'Invalid expression: {e}',file=sys.stderr)
            continue
        
        lins = [c.linearize(e) for c in concretes]
        rows.append([t]+lins)
    
    with open(args.treebank,'w') as f:
        wrtr = csv.writer(f)
        wrtr.writerows(rows)