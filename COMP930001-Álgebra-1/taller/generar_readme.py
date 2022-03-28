import os
import re
import datetime

# Rellenar con ceros al comienzo de un numero. 1 -> 01
def format_two(string: str) -> str:
    return string.zfill(2)

# Si el año está escrito como /2022 -> /22, sino dejarlo como estaba y rellenarlo con ceros.
def format_year(string: str):
    if len(string) == 2:
        return string
    else:
        return string[-2:].zfill(2)
    
# Formatear la terna de numeros devuelta despues de haber matcheado con regex
def format_tuple(match: tuple) -> str:
    result = (format_two(match[0]), format_two(match[1]), format_year(match[2]))
    return '/'.join(result)

# Convertir una string de fecha a un objeto de Datetime
def strdate(string: str) -> datetime.datetime:
    return datetime.datetime.strptime(string ,'%d/%m/%y')

# Leer un archivo, especificando su ruta, y extraer la primer fecha que encuentre
def extraer_fecha(archivo_clase_filepath: str, fr='%d/%m/%Y') -> datetime.datetime:
    patron_fecha = '([0-9]+)\/([0-9]+)\/+([0-9]+)'
    with open(archivo_clase_filepath, 'r', encoding='utf-8') as f:
        text = f.read()
        match = re.search(patron_fecha, text)
        match = match.groups()
        
        date_string = format_tuple(match)
        date = strdate(date_string)
        return date.strftime(fr)

# Dado el nombre del archivo (clase-1, clase-20, clase_55), convertirlo a una string más linda
def extraer_clase(str_clase: str) -> str:
    patron_clase = '([a-zA-Z]*).([0-9]+)'
    match = re.search(patron_clase, str_clase)
    if match:
        return f'Clase {int(match.groups()[1])}'

# Generar el README.md final
def generar_markdown(cdict: dict) -> str:
    items = []
    for nombre,path in cdict.items():
        item = f'''<li><h3><a href="{path}">{nombre}</a></h3></li>'''
        items.append(item)
    items = '\n'.join(items)
    
    prefix = f"<div align='center'>\n  <h1>\n    Taller de Álgebra\n  </h1>\n</div>\n\n### Acceso Rápido\n\n<ul>{items}\n</ul>"
    
    return prefix


# Obtener todas las carpetas en el directorio y almacenarlas en 'clases'
listdir = os.listdir()
clases = []
for folder in listdir:
    if folder.startswith('clase'):
        clases.append(folder)

# Por cada carpeta, buscar sus README.md, y dentro de ellos extraer fecha y nombre,
# una vez extraídos, agregarlos a 'clases_dict'.
clases_dict = dict()
for clase in clases:
    directory = f'./{clase}'
    files = os.listdir(directory)
    for file in files:
        if file == 'README.md':
            filepath = f'{directory}/{file}'
            fecha = extraer_fecha(filepath)
            nombre = extraer_clase(clase)
            final = f'{nombre} - ({fecha})'
            clases_dict[final] = filepath

# Generar markdown y guardarlo
markdown = generar_markdown(clases_dict)
with open('result.md', 'w', encoding='utf-8') as output:
    output.write(markdown)