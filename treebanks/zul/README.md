# isiZulu treebanks

## Manually curated

We include two kinds of manually curated treebanks. The first, `manual.10k.csv` originated
from work done to accurately model the isiZulu noun phrase. The treebank has been semi-automatically generated and
manually evaluated for correctness (with a random sample of 50 sentences, covering all functions in
the treebank). The included PGF (portable grammar format), `MultiLexLang.pgf` can be used to linearise the
trees as follows. (Use `pip install pgf` to install the GF C runtime with Python bindings.)

    > import pgf
    > import csv
    > with open('manual.10k.csv') as f:
        rd = csv.reader(f)
        rows = [r for r in rd]
    > rows = rows[1:] # discard heading row
    > g = pgf.readPGF('MultiLexLang.pgf')
    > zul = g.languages['MultiLexLangZul']
    > for (tree_str,lin) in rows[:100]: # try it out with the first 100
        tree = pgf.readExpr(tree_str)
        lin = zul.linearize(tree)
        print(lin)

The second kind og manually curated treebank are the regression treebanks created to continuously monitor development of the resource grammar. They
have been hand-crafted to esnure accurate modelling of the isiZulu verb phrase in both main clauses and relative clauses. They can be found in the `regression` directory.

## Automatically generated

The automatically generated treebank was used to assess the linguistic coverage of the isiZulu resource grammar on a suitable corpus. The usage examples from the African Wordnet project were chosen because of their high
quality and their nature as sentences giving typical usage of isiZulu words.

As with the manually curated treebank, a PGF has been supplied with which the corpus was created, namely `ZMLargeExtChunk.pgf`. It can be loaded in a similar way as shown above to recreate the parses given in the treebank.

The resource grammar by necessity includes ambiguities that exist in isiZulu, and hence we present the treebank as the JSON formatted output of the parsing process, which includes the first five parses returned by the GF runtime. The parser was minimally guided by a probabilities file which mainly focused on encouraging non-symbol chunks.

An analysis of the successes and failures of the parser will be added to this README in due course.
