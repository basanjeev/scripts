#!/usr/bin/env python3

from reportlab.platypus import SimpleDocTemplate, Table
simplelist = [
    "A for apple",
    "B for Ball"
]
elements = []
for elem in simplelist:
    elements.append(elem)

doc = SimpleDocTemplate("simple_table.pdf")
doc.build(elements)
