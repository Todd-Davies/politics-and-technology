from TexSoup import TexSoup
from string import Template
import sys

template_string = """
\\documentclass[frontgrid]{flacards}
\\usepackage{tabularx}
\\usepackage{color}

\\geometry{landscape}

\\definecolor{light-gray}{gray}{0.75}

\\begin{document}

\\pagesetup{3}{4}

$content

\\end{document}
"""

f = open(sys.argv[1], 'r')
soup = TexSoup(f.read())

def clean_answer(answer):
  return ' '.join(answer.split())

content = ""

for i in soup.find_all('defn'):
  answer = ''.join([item for sublist in i[1:] for item in sublist])
  content += "\card{\n  %s\n}{\n  %s\n}\n" % (i[0], clean_answer(answer))

print(Template(template_string).substitute(content=content))
