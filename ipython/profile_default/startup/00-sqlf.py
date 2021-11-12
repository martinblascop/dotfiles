""" ~/.ipython/profile_default/startup/00-sqlf.py
Requires sqlparse (`pip install sqlparse`)

Example:
In [1]: %sqlf str(Site.objects.all().query)
SELECT `django_site`.`id`,
       `django_site`.`domain`,
       `django_site`.`name`
FROM `django_site`
ORDER BY `django_site`.`domain` ASC
"""
from __future__ import print_function

import sys
from IPython.core.magic import register_line_magic

try:
    import sqlparse
except ImportError as e:
    print("[line-magic] %sqlf requires `pip install sqlparse`")

    
@register_line_magic
def sqlf(line):
    output = eval("str(%s)" % line)
    print(sqlparse.format(output, reindent=True))
