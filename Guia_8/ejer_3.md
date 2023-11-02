Se sabe que la rotación de una imagen realizada pixel a pixel puede ser altamente
paralelizable. En particular, una rotación z alrededor del punto (x0, y0) se puede lograr
mapeando cada pixel (x1, y1) a su nueva posición (x2, y2) de la siguiente manera:

x2 = cos(z) * (x1-x0) - sin(z)*(y1-y0) + x0

y2 = sin(z) * (x1-x0) - cos(z)*(y1-y0) + y0

Utilizando las funciones de lectura y escritura de archivos de mapa de bits (extensión .bmp),
 se pide realizar un programa OpenCL que lea una imagen, ejecute una
rotación en forma paralela de la misma, y guarde el resultado en otra imagen. El ángulo de
rotación y punto (x0, y0) queda a elección del alumno (cuidado con los pixeles que queden fuera
del marco de la imagen)
