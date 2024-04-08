# -*- coding: utf-8 -*-

import os
import re
import pgf
import subprocess
import csv
import json

LANG_CODE="Zul"
DELIM=','
COMMENT = '#'

def read_paired_input(in_str):
    lines = in_str.split("\n")
    pairs = []
    number = 0
    for l in lines:
        number += 1
        elements = l.split(",",1)
        if len(elements) == 2:
            pairs.append(tuple([str(number)]+elements))
    return pairs

def read_tree_input(in_str,conc_grammar):
    print("Reading trees...")
    lines = in_str.split("\n")
    pairs = []
    number = 0
    for l in lines:
        l_parts = l.split(DELIM)
        number += 1
        tree_str = l_parts[0].strip()
        try:
            tree_expr = pgf.readExpr(tree_str)
            lin = conc_grammar.linearize(tree_expr)
            pairs.append((str(number),tree_str,lin))
        except pgf.PGFError as e:
            print("error, skipping",tree_str)
    return pairs

def generate_pairs(tree_strs,conc_grammar):
    pairs = []
    for tree_str in tree_strs:
        try:
            tree_expr = pgf.readExpr(tree_str)
            print(tree_str)
            lin = conc_grammar.linearize(tree_expr)
            pairs.append((tree_str,lin))
        except pgf.PGFError as e:
            print("error, skipping",tree_str)
    return pairs

def generate_image(tree,grammar,filenamebase,imgdirpath):

    imagepath = imgdirpath
    try:
        os.makedirs(imagepath)
    except FileExistsError:
        pass

    expr = pgf.readExpr(tree)
    dotfilepath = os.path.join(imagepath,filenamebase+'.dot')
    pngfilename = filenamebase+'.png'
    pngfilepath = os.path.join(imagepath,pngfilename)
    dotfile = open(dotfilepath,'w')
    dotfile.write(grammar.graphvizAbstractTree(expr))
    dotfile.close()

    subprocess.run(["dot","-Tpng",dotfilepath,"-o",pngfilepath])

    return pngfilename

def generate_html(imglin_pairs,image_folder):
    html_head = "<head><style>th, td { padding: 15px; font-size: large; } table,td { border: 1px solid black; }</style></head>"
    html_code = "<body><table>\n\t<tr>\n\t\t<th>Number</th><th>Tree</th><th>Linearisation</th>\n\t</tr>\n"
    for (number,img,lin) in imglin_pairs:
        html_code += f'\t<tr>\t\t<td>{number}</td>'
        html_code += f'<td style="width:70%;"><img src={image_folder}/{img} style="max-height:100%; max-width:100%"></td>'
        html_code += f'<td>{lin}</td>\n\t</tr>'
    html_code += "</table></body>"
    return html_head + html_code

def input2html(infilepath,outdirpath,grammar,lang_code,read_input_fun):

    (indirpath,infilename) = os.path.split(infilepath)

    infilenamebase = infilename[:infilename.rindex('.')]
    htmlfilepath = os.path.join(outdirpath,infilenamebase + '.html')
    csvfilepath = os.path.join(outdirpath,infilenamebase + '.csv')

    in_str = open(infilepath,'r').read()
    for l in grammar.languages:
        if l.endswith(lang_code):
            conc_grammar = grammar.languages[l]
            break
    treelin_pairs = read_input_fun(in_str,conc_grammar)
    with open(csvfilepath,'w') as f:
        writer = csv.writer(f)
        for row in treelin_pairs:
            writer.writerow(row[1:])
    print("Generating images...")
    image_folder = "images_"+infilenamebase

    imglin_pairs = [(number,generate_image(tree,grammar,infilenamebase+'_'+number,os.path.join(outdirpath,image_folder)),lin) for (number,tree,lin) in triples]
    html_code = generate_html(imglin_pairs,image_folder)
    print("Writing HTML...")
    outfile = open(htmlfilepath,'w')
    outfile.write(html_code)

def pairs2html(treelin_pairs,infilepath,outdirpath,grammar,lang_code):

    (indirpath,infilename) = os.path.split(infilepath)
    infilenamebase = infilename[:infilename.rindex('.')]
    htmlfilepath = os.path.join(outdirpath,infilenamebase + '.html')

    print("Generating images...")
    image_folder = "images_"+infilenamebase
    triples = [(str(i),pairs[i][0],pairs[i][1]) for i in range(len(pairs))]
    imglin_pairs = [(number,generate_image(tree,grammar,infilenamebase+'_'+number,os.path.join(outdirpath,image_folder)),lin) for (number,tree,lin) in triples]
    html_code = generate_html(imglin_pairs,image_folder)
    print("Writing HTML...")
    outfile = open(htmlfilepath,'w')
    outfile.write(html_code)

def analyses2html(analyses_data,infilepath,outdirpath,grammar,lang_code):

    print(len(analyses_data))

    (indirpath,infilename) = os.path.split(infilepath)
    infilenamebase = infilename[:infilename.rindex('.')]
    htmlfilepath = os.path.join(outdirpath,infilenamebase + '.html')
    jsfilepath = os.path.join(outdirpath,infilenamebase + '.js')

    print("Generating images...")
    image_folder = "images_"+infilenamebase
    imglin_pairs = [(generate_image(tree,grammar,infilenamebase+'_'+lin.replace(' ','_'),os.path.join(outdirpath,image_folder)),lin) for (tree,lin,analyses) in analyses_data]

    img_data = []
    for (tree,lin,analyses) in analyses_data:
        img = [img for (img,l) in imglin_pairs if lin == l][0]
        img_data.append((tree,lin,analyses,img))
    print(len(img_data))

    script = ''

    html_head = "<head><style>th, td { padding: 15px; font-size: large; } table,td { border: 1px solid black; }</style></head>\n"
    html_code = "<body><table>\n\t<tr>\n\t\t<th>Tree</th><th>Analysis</th>\n\t</tr>\n"
    for (tree,lin,analyses,img) in img_data:
        html_code += f'\t<tr>' #\t\t<td>{number}</td>
        html_code += f'<td style="width:35%;"><img src={image_folder}/{img} style="max-height:100%; max-width:100%"><br><b>{lin}</b><br>{tree}</td>'

        lin_name = lin.replace(' ','_')
        html_code += f'\n<td><table>\n\t<tr id="{lin_name}">' # open row tag

        for tok in analyses.keys():
            html_code += f'\t\t<td id="{lin_name}_{tok}">' # open cell tag

            for a in analyses[tok]:

                id = a.replace('[','_').replace(']','_')
                html_code += f'\t\t<input type="radio" id="{id}" name="{lin_name}_{tok}" value="{a}"><label for="{id}">{a}</label><br>\n'

            html_code += '</td>\n' # close cell tag

        html_code += '\t\t<td>' # open cell tag
        fun_name = lin_name
        html_code += f'<button onclick="{fun_name}()">Save</button>'
        script += '\n'
        script += f'function {fun_name}() ' + '{\n'
        script += f' var tr = document.getElementById("{fun_name}")\n'
        script += '  var token_names = []\n'
        script += '  for (d = 0 ; d < tr.children.length; d ++) {\n'
        script += '    if (tr.children[d].id.length > 0) {\n'
        script += '      token_names.push(tr.children[d].id)\n'
        script += '    }\n'
        script += '  }\n'
        script += '  console.log(token_names)\n\n'
        script += '  var analysis = ""\n'
        script += '  for (t = 0 ; t < token_names.length ; t++) {\n'
        script += '    var analyses = document.getElementsByName(token_names[t])\n'
        script += '    for (i = 0 ; i < analyses.length ; i++) {\n'
        script += '      if (analyses[i].checked) {\n'
        script += '        analysis += " " + analyses[i].value\n'
        script += '        console.log(analysis)\n'
        script += '      }\n'
        script += '    }\n'
        script += '  }\n'
        script += f'  document.getElementById("selections").innerHTML = document.getElementById("selections").innerHTML + "<br>" + "{lin}: "  + analysis\n'
        script += f'  console.log("{lin}")\n'
        script += '}\n'
        html_code += '</td>\n' # close cell tag

        html_code += '\t</tr>\n</table></td>' # close row tag

        html_code += f'\n\t</tr>'
    html_code += "</table>\n"

    html_code += '<div id="selections"><br><br></div>'

    html_code += f'<script src="{jsfilepath}"></script>\n'
    html_code += '</body>'

    with open(jsfilepath,'w') as f:
        f.write(script)

    print("Writing HTML...")
    with open(htmlfilepath,'w') as f:
        f.write(html_head+html_code)


def regression_test(grammar,treelin_pairs,lang_code):
    failures = []
    conc_grammar = grammar.languages[grammar.abstractName+lang_code]
    for (tree,lin) in treelin_pairs:
        try:
            expr = pgf.readExpr(tree)
            genlin = conc_grammar.linearize(expr)
            if not genlin == lin:
                failures.append((tree,lin,genlin))
        except pgf.PGFError as e:
            failures.append(tree,'','')
    return failures

if __name__ == '__main__':

    import argparse

    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest='subparser_name', help='sub-command help')

    parser_viz_trees = subparsers.add_parser('viz_trees', help='visualise the linearisations of a set of trees')
    parser_viz_analysis = subparsers.add_parser('viz_analysis', help='show the morphological analyses of a set of trees')
    parser_rt = subparsers.add_parser('regression',help='perform regression test')

    parser_viz_trees.add_argument("input",help="file containing trees")
    parser_viz_trees.add_argument("grammar",help="PGF grammar")
    parser_viz_trees.add_argument("mode",choices=["generate","evaluate"],help="specify whether linearisations should be generated or read from csv file")
    parser_viz_trees.add_argument("-d",dest="outdirpath",default=".",help="directory to save html file (default: .)")
    parser_viz_trees.add_argument("-l",dest="lang_code",help="3-letter ISO code")

    parser_viz_analysis.add_argument("trees",help="file containing trees")
    parser_viz_analysis.add_argument("analyses",help="json file containing analyses")
    parser_viz_analysis.add_argument("grammar",help="PGF grammar")
    parser_viz_analysis.add_argument("-d",dest="outdirpath",default=".",help="directory to save html file (default: .)")
    parser_viz_analysis.add_argument("-l",dest="lang_code",help="3-letter ISO code")

    parser_rt.add_argument("grammar",help="PGF grammar")
    parser_rt.add_argument("treebank",help="gold standard treebank")
    parser_rt.add_argument("-r",dest="reportpath",help="path to file to save report (default: .)")
    parser_rt.add_argument("-l",dest="lang_code",help="3-letter ISO code")

    args = parser.parse_args()

    lang_code = args.lang_code if args.lang_code else LANG_CODE
    grammar = pgf.readPGF(args.grammar)

    if args.subparser_name == 'viz_trees':
        infilepath = args.input
        if args.mode == "evaluate":
            with open(infilepath) as f:
                rd = csv.reader(f)
                pairs = [(r[0],r[1]) for r in rd]
        if args.mode == "generate":
            for l in grammar.languages:
                if l.endswith(lang_code):
                    conc_grammar = grammar.languages[l]
                    break
            with open(infilepath) as f:
                with open(infilepath) as f:
                    rd = csv.reader(f)
                    trees = [r[0] for r in rd]
                    pairs = generate_pairs(trees,conc_grammar)

            (indirpath,infilename) = os.path.split(infilepath)
            infilenamebase = infilename[:infilename.rindex('.')]
            csvfilepath = os.path.join(args.outdirpath,infilenamebase + '.generated.csv')
            with open(csvfilepath,'w') as f:
                writer = csv.writer(f)
                for row in pairs:
                    writer.writerow(row)
        pairs2html(pairs,infilepath,args.outdirpath,grammar,lang_code)
    if args.subparser_name == 'viz_analysis':
        trees_filepath = args.trees
        for l in grammar.languages:
            if l.endswith(lang_code):
                conc_grammar = grammar.languages[l]
                break
        with open(trees_filepath) as f:
            with open(trees_filepath) as f:
                rd = csv.reader(f)
                trees = [r[0] for r in rd]
                pairs = generate_pairs(trees,conc_grammar)
        analyses_filepath = args.analyses
        with open(analyses_filepath) as f:
            analyses = json.loads(f.read())
        data = []
        for (tree,lin) in pairs:
            lin_toks = lin.split()
            lin_analyses = {}
            for t in lin_toks:
                try:
                    t_analyses = analyses[t]
                except KeyError:
                    t_analyses = []
                lin_analyses[t] = t_analyses
            data.append((tree,lin,lin_analyses))
        analyses2html(data,trees_filepath,args.outdirpath,grammar,lang_code)
    else:
        if args.reportpath:
            reportpath = args.reportpath
            reportdir = os.path.split(args.reportpath)[0]
        else:
            reportpath = "regression.report"
            reportdir = "."
        treelin_pairs = []
        with open(args.treebank, newline='') as csvfile:
            treebankreader = csv.reader(csvfile)
            rows = [r for r in treebankreader]
            try:  # if there is a header
                tree_col = rows[0].index('tree')
                lin_col = rows[0].index(lang_code.lower())
                offset = 1
            except ValueError: # assume there is no header
                tree_col = 0
                lin_col = 1
                offset = 0
            for row in rows[offset:]:
                pair = (row[tree_col],row[lin_col])
                if len(pair) == 2 and not pair[0].startswith(COMMENT):
                    treelin_pairs.append(pair)
        failures = regression_test(grammar,treelin_pairs,lang_code)
        if len(failures) > 0:
            reportfilename = os.path.join(reportpath)
            with open(reportfilename, 'w', newline='') as csvfile:
                reportwriter = csv.writer(csvfile)
                reportwriter.writerow(['tree', 'expected','generated'])
                for row in failures:
                    reportwriter.writerow(row)
            print("Some tests failed; see report.")
        else:
            reportfilename = os.path.join(reportpath)
            with open(reportfilename, 'w', newline='') as csvfile:
                pass
            print("Regression test succeeded")
